# robotpkg Makefile for:	graphics/ros-robot-model
# Created:			Anthony Mallet on Fri,  5 Jul 2013
#

ROS_PKG=		robot_model
ROS_METAPKG=		yes
ROS_VERSION=		1.11.5

CATEGORIES=		graphics
ROS_COMMENT=		robot modeling in Xml Robot Description Format (URDF)

include ../../meta-pkgs/ros-base/Makefile.common

CMAKE_ARGS+=		-DCOLLADA_DOM_DIR=${PREFIX.collada-dom}

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=\
  joint_state_publisher/joint_state_publisher/joint_state_publisher

DEPEND_ABI.orocos-kdl+=	orocos-kdl>=1.3

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-cmake-modules/depend.mk
include ../../devel/ros-pluginlib/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../graphics/assimp/depend.mk
include ../../graphics/collada-dom/depend.mk
include ../../graphics/ros-geometric-shapes/depend.mk
include ../../graphics/ros-srdfdom/depend.mk
include ../../graphics/urdfdom-headers/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../math/ros-angles/depend.mk
include ../../math/ros-geometry/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../motion/orocos-kdl/depend.mk
include ../../net/ros-resource-retriever/depend.mk
include ../../sysutils/ros-console-bridge/depend.mk
include ../../mk/sysdep/libcurl.mk
include ../../mk/robotpkg.mk

# resource_retriever is packaged separately, because of a circular dependency
# issue with geometric_shapes
post-extract:
	${RUN}${RM} -rf ${WRKSRC}/resource_retriever
