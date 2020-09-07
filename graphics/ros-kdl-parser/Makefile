# robotpkg Makefile for:	graphics/ros-kdl-parser
# Created:			Anthony Mallet on Wed, 12 Sep 2018
#

PKGREVISION=		2
ROS_PKG=		kdl_parser
ROS_METAPKG=		yes
ROS_VERSION=		1.13.1

CATEGORIES=		graphics
ROS_COMMENT=		tool to build a KDL tree from an URDF robot model

include ../../meta-pkgs/ros-base/Makefile.common

DEPEND_ABI.orocos-kdl+=	orocos-kdl>=1.3

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-cmake-modules/depend.mk
include ../../devel/tinyxml/depend.mk
include ../../graphics/ros-urdf/depend.mk
include ../../graphics/urdfdom-headers/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../motion/orocos-kdl/depend.mk
include ../../motion/py-orocos-kdl/depend.mk
include ../../sysutils/py-catkin-pkg/depend.mk
include ../../sysutils/ros-console/depend.mk
include ../../mk/sysdep/tinyxml2.mk
include ../../mk/robotpkg.mk
