# robotpkg Makefile for:	devel/boost-build
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

# Borrowed from NetBSD pkgsrc,
# $NetBSD: Makefile,v 1.10 2008/05/26 02:13:17 joerg Exp $

BOOST_PACKAGE=		build
BOOST_COMMENT=		(Boost.Build framework)
BOOST_CONFIG=		no

include ../../devel/boost/Makefile.common

SUBST_CLASSES+=		confdir
SUBST_MESSAGE.confdir=	Fixing path to site-config.jam.
SUBST_STAGE.confdir=	pre-build
SUBST_FILES.confdir=	tools/build/v2/build-system.jam
SUBST_SED.confdir=	-e 's,/etc,${PKG_SYSCONFDIR},g'

EGDIR=                  ${PREFIX}/share/examples/boost-build

post-extract:
	${FIND} ${WRKSRC}/tools/build/v2 -type d -exec ${CHMOD} 755 {} \;
	${FIND} ${WRKSRC}/tools/build/v2 -type f -exec ${CHMOD} 644 {} \;

do-build:
	${RUN}								\
	{ ${ECHO} '# System wide configuration file for Boost.Build.' ; \
	  ${ECHO} ; 							\
	  ${ECHO} 'using ${BOOST_TOOLSET}::"${CXX}" ;' ;		\
	} >${WRKDIR}/site-config.jam

do-install:
	${RUN}${INSTALL_DATA_DIR} ${PREFIX}/share/boost-build
	${RUN}cd ${WRKSRC}/tools/build/v2 && $(PAX) -rw -pp -pm		\
		-s ':^.*\.orig$$::' . ${PREFIX}/share/boost-build
	${RUN}${INSTALL_DATA_DIR} ${EGDIR}
	${RUN}${INSTALL_DATA} ${WRKDIR}/site-config.jam ${EGDIR}

include ../../pkgtools/pax/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/robotpkg.mk
