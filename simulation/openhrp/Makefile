# robotpkg Makefile for:	simulation/OpenHRP
# Created:			Anthony Mallet on Wed, 22 Oct 2008
#

VERSION=		3.0.1
DISTNAME=		OpenHRP-${VERSION}
EXTRACT_SUFX=		.zip

COMMENT=		Open Architecture Humanoid Robotics Platform
CATEGORIES=		simulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
HOMEPAGE=		http://www.openrtp.jp/openhrp3/en/index.html
LICENSE=		eclipse

MAINTAINER=		openrobots@laas.fr
PREFIX=			${LOCALBASE}/OpenHRP

CONFLICTS+=		openhrp-jrl	# old package (OpenHRP2)

SUBST_CLASSES+=			openhrp-paths
SUBST_STAGE.openhrp-paths=	post-configure
SUBST_MESSAGE.openhrp-paths=	Fixing installation directories.
SUBST_SED.openhrp-paths=	\
	-e 's|@PREFIX@|${PREFIX}|g'

SUBST_FILES.openhrp-paths=\
	bin/unix/CollisionDetector.sh		\
	bin/unix/DynamicsSimulator.sh		\
	bin/unix/ModelLoader.sh			\
	bin/unix/GrxUI.sh			\
	bin/unix/NameServer.sh

# we need g++>=4.2
USE_LANGUAGES+=	c++
GCC_REQUIRED+=	>=4.2

include ../../middleware/openrtm-aist/depend.mk
include ../../math/tvmet/depend.mk
include ../../math/lapack/depend.mk
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../middleware/omniORB/depend.mk
include ../../devel/sun-jmf/depend.mk
include ../../devel/sun-java3d/depend.mk
include ../../lang/jython/depend.mk
include ../../lang/sun-jdk6/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../mk/robotpkg.mk

do-configure:
	@${SED} 							\
		-e 's|@PREFIX.omniORB@|${PREFIX.omniORB}|g' 		\
		-e 's|@PREFIX.boost-headers@|${PREFIX.boost-headers}|g' \
		-e 's|@PREFIX.boost-libs@|${PREFIX.boost-libs}|g'	\
		-e 's|@PREFIX.tvmet@|${PREFIX.tvmet}|g' 		\
		-e 's|@PREFIX.lapack@|${PREFIX.lapack}|g' 		\
		-e 's|@PREFIX.openrtm-aist@|${PREFIX.openrtm-aist}|g'	\
		-e 's|@JAVA_HOME@|${JAVA_HOME}|g' 			\
		-e 's|@JYTHON_HOME@|${JYTHON_HOME}|g' 			\
		< ${FILESDIR}/Make.vars > ${WRKSRC}/Make.vars

# This install is a bit broken in that it copies all files (e.g. sources
# and Makefiles). Later...
do-install:
	cd ${WRKSRC} && ${PAX} -rwp ma . ${PREFIX}
