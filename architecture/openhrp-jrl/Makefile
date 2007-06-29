# Copyright (c) 2006 LAAS/CNRS                         -- Fri Dec  8 2006
# All rights  reserved.
#

VERSION=		20060713
DISTNAME=		OpenHRP
PKGNAME=		openhrp-jrl-${VERSION}
PKGREVISION=		6
WRKSRC=			${WRKDIR}/OpenHRP

CATEGORIES=		architecture
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

DISTFILES=\
	OpenHRP${VERSION}.tgz	\
	HRP2JRLgrx${VERSION}.tar.gz

MAINTAINER=		openrobots@laas.fr
COMMENT=		Open Architecture Humanoid Robotics Platform

RESTRICTED=		Redistribution of repackaged binaries not permitted
NO_PUBLIC_SRC=		${RESTRICTED}
NO_PUBLIC_BIN=		${RESTRICTED}

DEPENDS+=		sun-jdk14>=2.9:../../lang/sun-jdk14
DEPENDS+=		sun-java3d>=1.4:../../devel/sun-java3d
DEPENDS+=		sun-jmf>=2.1:../../devel/sun-jmf
DEPENDS+=		jython>=2.2:../../lang/jython
DEPENDS+=		vrml97>=1.0:../../graphics/vrml97

INTERACTIVE_STAGE=	fetch
FETCH_MESSAGE+= " The files"
$(foreach __file__,${DISTFILES},$(eval FETCH_MESSAGE+="	${__file__}"))
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " must be put manually into:"
FETCH_MESSAGE+= "       ${DISTDIR}/"

NO_CONFIGURE=		yes
BUILD_DIRS=		bin
BUILD_MAKE_FLAGS+=	ROBOT=HRP2JRL
INSTALL_DIRS=		Common/corba

ROBOT_HOST?=		hrp2014c
ROBOT_PORT?=		5005

SUBST_CLASSES+=			openhrp-paths
SUBST_STAGE.openhrp-paths=	post-build
SUBST_MESSAGE.openhrp-paths=	Fixing installation directories.
SUBST_SED.openhrp-paths=	\
	-e 's|@PREFIX@|${PREFIX}|g'				\
	-e 's|@ROBOT_HOST@|${ROBOT_HOST}|g'			\
	-e 's|@ROBOT_PORT@|${ROBOT_PORT}|g'

SUBST_FILES.openhrp-paths=$(call quote,				\
	bin/config.sh						\
	bin/Auditor.sh						\
	bin/NameServer.sh					\
	bin/ModelLoader2.sh					\
	bin/CollisionDetector.sh				\
	bin/Dynamics.sh						\
	bin/HRPController.sh					\
	client/gui2/property/default.properties)

PLIST_SRC=		${WRKDIR}/PLIST

include ../../mk/robotpkg.mk

do-extract:
	cd ${WRKDIR} && ${TAR} xzf ${DISTDIR}/OpenHRP${VERSION}.tgz
	cd ${WRKSRC} && ${TAR} xzf ${DISTDIR}/HRP2JRLgrx${VERSION}.tar.gz
	cp ${FILESDIR}/HRP2JRLmain.wrl.longneck.clean	\
		${WRKSRC}/etc/HRP2JRL/HRP2JRLmain.wrl
	cp ${FILESDIR}/HEAD_LINK1.wrl.longneck		\
		${WRKSRC}/etc/HRP2JRL/.

post-install:
	${CAT} ${FILESDIR}/plist | (cd ${WRKDIR} && ${PAX} -rwp ma ${PREFIX})
	${CAT} ${FILESDIR}/plist > ${PLIST_SRC}
	${CAT} ${PKGDIR}/PLIST >> ${PLIST_SRC}
