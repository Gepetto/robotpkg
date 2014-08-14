# robotpkg Makefile for:	graphics/ros-geometric-shapes
# Created:			Anthony Mallet on Thu, 14 Aug 2014
#

ROS_PKG=		geometric_shapes
ROS_VERSION=		0.4.1
ROS_REPO=		ros-planning

CATEGORIES=		graphics
ROS_COMMENT=		generic definitions of geometric shapes and bodies

include ../../meta-pkgs/ros-base/Makefile.common

USE_BOOST_LIBS=	filesystem math

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-cmake-modules/depend.mk
include ../../graphics/assimp/depend.mk
include ../../graphics/ros-shape-tools/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../mapping/octomap/depend.mk
include ../../math/eigen3/depend.mk
include ../../math/ros-eigen-stl-containers/depend.mk
include ../../math/ros-random-numbers/depend.mk
include ../../net/ros-resource-retriever/depend.mk
include ../../sysutils/console-bridge/depend.mk
include ../../mk/sysdep/qhull.mk
include ../../mk/robotpkg.mk
