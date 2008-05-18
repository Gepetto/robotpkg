# $Id: Makefile 2008/05/07 15:05:41 mallet $
#

DISTNAME=		festival-1.96
CATEGORIES=		audio
MASTER_SITES=		http://festvox.org/packed/festival/latest/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://festvox.org/index.html
COMMENT=		Festival Speech Synthesis System

DISTFILES=		festival-1.96-beta.tar.gz	\
			speech_tools-1.2.96-beta.tar.gz

WRKSRC=			${WRKDIR}
FESTIVAL=		${WRKSRC}/festival
SPEECH_TOOLS=		${WRKSRC}/speech_tools

GNU_CONFIGURE=		yes
CONFIGURE_DIRS=		${SPEECH_TOOLS} ${FESTIVAL}

# --- optional OGI synthetiser ---------------------------------------

PKG_SUPPORTED_OPTIONS+=	ogireslpc
PKG_SUGGESTED_OPTIONS+=	ogireslpc

PKG_OPTION_DESCR.ogireslpc=	Compile OGI residual LPC synthetiser

OGIRESLPC.files=	OGIresLPC-2.2.tar.gz
OGIRESLPC.site=		http://www.cslu.ogi.edu/tts/download/data/

SITES.OGIresLPC-2.2.tar.gz=	${OGIRESLPC.site}
SITES.OGIlexicon-2.2.tar.gz=	${OGIRESLPC.site}

define PKG_OPTION_SET.ogireslpc
  DISTFILES+=		${OGIRESLPC.files}
  PKG_PATCHES+=		$(wildcard ${PATCHDIR}/ogi-patch-*)
  GENERATE_PLIST+=	${CAT} ${PKGDIR}/PLIST.ogireslpc;
endef

# the makesum target must compute checksum of all files, no matter what
# options are set
ifneq (,$(filter mdi distinfo makesum,${MAKECMDGOALS}))
  DISTFILES+=		${OGIRESLPC.files}
endif

# --------------------------------------------------------------------

include ../../mk/robotpkg.mk

pre-configure:
	${LN} -s ${WRKSRC}/speech_tools/config/systems/ix86_NetBSD.mak \
		${WRKSRC}/festival/config/systems/.

do-install:
	@for p in			\
		festival		\
		festival_client		\
		festival_server		\
		festival_server_control	\
		text2wave; do						\
		${INSTALL_PROGRAM} ${FESTIVAL}/bin/$$p ${PREFIX}/bin/.;	\
	done
	-@${MV} ${FESTIVAL}/lib/etc ${FESTIVAL}/.
	${INSTALL_PROGRAM} ${FESTIVAL}/etc/*/audsp ${PREFIX}/bin/.
	${INSTALL_LIB} ${FESTIVAL}/src/lib/libFestival.a ${PREFIX}/lib/.
	${INSTALL_LIB} ${SPEECH_TOOLS}/lib/libestbase.a ${PREFIX}/lib/.
	${INSTALL_LIB} ${SPEECH_TOOLS}/lib/libestools.a ${PREFIX}/lib/.
	${INSTALL_LIB} ${SPEECH_TOOLS}/lib/libeststring.a ${PREFIX}/lib/.
	${INSTALL_DATA_DIR} ${PREFIX}/include/festival
	${INSTALL_DATA_DIR} ${PREFIX}/share/festival
	cd ${SPEECH_TOOLS}/include && ${PAX} -rw *.h */*.h ${PREFIX}/include/festival/.
	cd ${FESTIVAL}/src/include && ${PAX} -rw *.h ${PREFIX}/include/festival/.
	cd ${FESTIVAL} && ${PAX} -rw lib examples ${PREFIX}/share/festival/.
