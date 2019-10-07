# robotpkg Makefile for:	sysutils/ros-rospack
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

ROS_PKG=	rospack
ROS_VERSION=	2.5.1

CATEGORIES=	sysutils
ROS_COMMENT=	command-line tool for retriving package information

CONFLICTS+=	rospack # old package name

include ../../meta-pkgs/ros-base/Makefile.common

CMAKE_ARGS+=	-DTinyXML2_ROOT_DIR=${PREFIX.tinyxml}

DEPEND_ABI.ros-catkin+=	${PKGTAG.python-}ros-catkin>=0.5.64

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-cmake-modules/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../sysutils/py-catkin-pkg/depend.mk
include ../../sysutils/py-rosdep/depend.mk
include ../../mk/sysdep/tinyxml2.mk
include ../../mk/robotpkg.mk
