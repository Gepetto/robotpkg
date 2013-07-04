# robotpkg Makefile for:	graphics/ros-robot-model
# Created:			Anthony Mallet on Fri,  5 Jul 2013
#

ROS_PKG=		robot_model
ROS_METAPKG=		yes
ROS_VERSION=		1.9.36
ROS_REPO=		ros

CATEGORIES=		graphics
ROS_COMMENT=		robot modeling in Xml Robot Description Format (URDF)

include ../../meta-pkgs/ros-base/Makefile.common

CMAKE_ARGS+=		-DCOLLADA_DOM_DIR=${PREFIX.collada-dom}

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=\
  visualization/joint_state_publisher/joint_state_publisher

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../graphics/assimp/depend.mk
include ../../graphics/collada-dom/depend.mk
include ../../graphics/ros-srdfdom/depend.mk
include ../../graphics/urdfdom-headers/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../math/ros-angles/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../motion/ros-orocos-kdl/depend.mk
include ../../sysutils/ros-console-bridge/depend.mk
include ../../mk/sysdep/libcurl.mk
include ../../mk/sysdep/tinyxml.mk
include ../../mk/robotpkg.mk
