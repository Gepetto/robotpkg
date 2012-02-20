# robotpkg Makefile for:	middleware/ros-core
# Created:			Anthony Mallet on Wed, 19 Jan 2011
#

PKGVERSION=	1.6.8
PKGREVISION=	2
MASTER_SITES=	${MASTER_SITE_ROS:=ros/tags/ros-${PKGVERSION_NOREV}}
NOT_FOR_PLATFORM=

ROS_PACKAGE=			core
ROS_COMMENT=			core tools
ROS_INSTALLATION_SUBDIR=	ros
ROS_BOOTSTRAP=			yes

FETCH_METHOD=			svn
include ../../meta-pkgs/ros-base/Makefile.common

# Build environment and tool
MAKE_ENV+=	PATH=$(call quote,${WRKSRC}/bin:${PATH})
MAKE_ENV+=	ROS_ROOT=${WRKSRC}
MAKE_ENV+=	PYTHONPATH=$(call quote,${WRKSRC}/core/roslib/src:${PYTHONPATH})
ifeq (MacOSX,${OPSYS})
  MAKE_ENV+=	DYLD_LIBRARY_PATH=${WRKSRC}/tools/rospack/lib
else
  MAKE_ENV+=	LD_LIBRARY_PATH=${WRKSRC}/tools/rospack/lib
endif

BUILD_MAKE_CMD=	${SETENV} ${MAKE_ENV} ${WRKSRC}/bin/rosmake
BUILD_MAKE_CMD+=--no-rosdep -i -V --disable-logging --bootstrap ros
ifneq (,$(call isno,${MAKE_JOBS_SAFE}))
  BUILD_MAKE_CMD+=--pjobs=1
else ifneq (,$(MAKE_JOBS))
  BUILD_MAKE_CMD+=--pjobs=$(MAKE_JOBS)
else
  BUILD_MAKE_CMD+=--pjobs=1
endif

# Configure default boost location
SUBST_CLASSES+=		boostdir
SUBST_STAGE.boostdir=	pre-configure
SUBST_MESSAGE.boostdir=	Configuring boost default location
SUBST_FILES.boostdir=	tools/rosboost_cfg/src/rosboost_cfg/rosboost_cfg.py
SUBST_SED.boostdir=	-e 's|@ROS_BOOST_ROOT@|${PREFIX.boost-headers}|'

# Configure make program
SUBST_CLASSES+=		gmake
SUBST_STAGE.gmake=	pre-configure
SUBST_MESSAGE.gmake=	Configuring GNU make program location
SUBST_FILES.gmake=	bin/rosmake tools/rospack/Makefile
SUBST_SED.gmake=	-e 's|@MAKE@|${MAKE}|'

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../archivers/zlib/depend.mk
include ../../archivers/bzip2/depend.mk
include ../../mk/robotpkg.mk
