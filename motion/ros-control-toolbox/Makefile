# robotpkg Makefile for:	devel/ros-pluginlib
# Created:			Anthony Mallet on Thu, 27 Jun 2013
#

PKGREVISION=	1
ROS_PKG=	control_toolbox
ROS_VERSION=	1.13.2
ROS_REPO=	ros-controls

CATEGORIES=	motion
ROS_COMMENT=	modules that are useful across all controllers
HOMEPAGE=	http://wiki.ros.org/control_toolbox

include ../../meta-pkgs/ros-base/Makefile.common

CMAKE_ARGS+=	-DTinyXML_INCLUDE_PATH=${PREFIX.tinyxml}/include
CMAKE_ARGS+=	-DTinyXML_LIBRARY_PATH=${PREFIX.tinyxml}/lib

USE_BOOST_LIBS=	thread

SUBST_CLASSES+=			py-interp
SUBST_FILES.py-interp+=		cfg/Parameters.cfg
SUBST_FILES.py-interp+=		scripts/tune_pid.py

include ../../devel/tinyxml/depend.mk
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-cmake-modules/depend.mk
include ../../devel/ros-realtime-tools/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../middleware/ros-dynamic-reconfigure/depend.mk
include ../../mk/robotpkg.mk
