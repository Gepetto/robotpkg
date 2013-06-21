# robotpkg Makefile for:	path/kineo-pp
# Created:			tho on Fri, 22 Dec 2006
#

KPPVERSION=		2.06
KPPPATCH=		014

PKGNAME=		kineo-pp-${KPPVERSION}.${KPPPATCH}
DISTNAME=		KiteLab-${KPPVERSION}.${KPPPATCH}_x86_linux_Robotpkg
EXTRACT_SUFX=		.tgz

WRKSRC=			${WRKDIR}/KPPSDK$(subst .,,${KPPVERSION})${KPPPATCH}

CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.kineocam.org/
COMMENT=		Software component dedicated to motion planning.

LICENSE=                kineocam-license

PKG_SUPPORTED_OPTIONS+=	debug
define PKG_OPTION_SET.debug
	KITE_SH=		Kited.sh
	KITE_EXECUTABLE=	${KINEO_DIR}/bin/Kited
	KINEOCONTROLLER_PC=	KineoController.pc.debug
	KITE_PC=		Kite.pc.debug
endef
define PKG_OPTION_UNSET.debug
	KITE_SH=		Kite.sh
	KITE_EXECUTABLE=	${KINEO_DIR}/bin/Kite
	KINEOCONTROLLER_PC=	KineoController.pc.release
	KITE_PC=		Kite.pc.release
endef

SUBST_CLASSES+=			kineopc
SUBST_STAGE.kineopc=		pre-configure
SUBST_MESSAGE.kineopc=		Generating pkg-config files.
SUBST_SED.kineopc=						\
	-e 's|@PREFIX@|${PREFIX}|g'				\
	-e 's|@KPPVERSION@|${KPPVERSION}|g'			\
	-e 's|@KPPPATCH@|${KPPPATCH}|g'

SUBST_FILES.kineopc=						\
	KineoController.pc					\
	Kite.pc

INTERACTIVE_STAGE=	fetch
FETCH_MESSAGE+= " The file ${DISTNAME}${EXTRACT_SUFX} containing KPP ${KPPVERSION}"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " must be put manually into:"
FETCH_MESSAGE+= "       ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}"

NO_BUILD=		yes
INSTALLATION_DIRS=\
	bin	\
	lib	\
	lib/pkgconfig \
	${KINEO_DIR}/bin \
	${KINEO_DIR}/bin/res	\
	${KINEO_DIR}/bin/modules	\
	${KINEO_DIR}/bin/modulesd	\
	${KINEO_DIR}/include	\
	${KINEO_DIR}/lib \
	${KINEO_DIR}/share \
	${KINEO_DIR}/share/doc		\
	${KINEO_DIR}/share/demos	


GCC_REQUIRED+=		>=4.0

include ../../pkgtools/pax/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

KINEO_DIR=		${PREFIX}/kineo-2.06

post-extract:
	${CHMOD} -R u+w ${WRKSRC}
	${CP} ${FILESDIR}/${KINEOCONTROLLER_PC} ${WRKSRC}/KineoController.pc
	${CP} ${FILESDIR}/${KITE_PC} ${WRKSRC}/Kite.pc

do-install:
	${PAX} -rw -pm -s '|${WRKSRC}/bin||' ${WRKSRC}/bin/Ki* ${KINEO_DIR}/bin
	${PAX} -rw -pm -s '|${WRKSRC}/bin/modules||' ${WRKSRC}/bin/modules ${KINEO_DIR}/bin/modules
	${PAX} -rw -pm -s '|${WRKSRC}/bin/modulesd||' ${WRKSRC}/bin/modulesd ${KINEO_DIR}/bin/modulesd
	${PAX} -rw -pm -s '|${WRKSRC}/include||' ${WRKSRC}/include ${KINEO_DIR}/include
	${PAX} -rw -pm -s '|${WRKSRC}/lib||' ${WRKSRC}/lib ${KINEO_DIR}/lib
	${PAX} -rw -pm -s '|${WRKSRC}/thirdPartyLib||' ${WRKSRC}/thirdPartyLib ${KINEO_DIR}/lib
	${PAX} -rw -pm -s '|${WRKSRC}/bin/res||' ${WRKSRC}/bin/res ${KINEO_DIR}/bin/res
	${PAX} -rw -pm -s '|${WRKSRC}/doc||' ${WRKSRC}/doc ${KINEO_DIR}/share/doc
	${PAX} -rw -pm -s '|${WRKSRC}/demos||' ${WRKSRC}/demos ${KINEO_DIR}/share/demos
	${SED} -e 's|@KINEO_DIR@|${KINEO_DIR}|' 		\
		< ${FILESDIR}/KineoAddonBuilder.sh > ${PREFIX}/bin/KineoAddonBuilder;	\
	${CHMOD} a+x ${PREFIX}/bin/KineoAddonBuilder;				\
	${CHMOD} a+x ${KINEO_DIR}/bin/KineoAddonBuilder;			\
	${SED} -e 's|@KINEO_DIR@|${KINEO_DIR}|' 		\
		< ${FILESDIR}/${KITE_SH} > ${PREFIX}/bin/Kite;	\
	${CHMOD} a+x ${PREFIX}/bin/Kite;				\
	${CHMOD} a+x ${KITE_EXECUTABLE};
	${INSTALL_DATA} ${WRKSRC}/KineoController.pc ${PREFIX}/lib/pkgconfig/KineoController.pc;
	${INSTALL_DATA} ${WRKSRC}/Kite.pc ${PREFIX}/lib/pkgconfig/Kite.pc;
