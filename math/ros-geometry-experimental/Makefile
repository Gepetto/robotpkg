# robotpkg Makefile for:	math/ros-geometry-experimental
# Created:			Anthony Mallet on Thu, 14 Aug 2014
#

ROS_PKG=	geometry_experimental
ROS_VERSION=	0.5.5
ROS_METAPKG=	yes

CATEGORIES=	math localization
ROS_COMMENT=	second generation transform library

include ../../meta-pkgs/ros-base/Makefile.common

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-roscpp-core/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../middleware/ros-actionlib/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../motion/orocos-kdl/depend.mk
include ../../simulation/bullet/depend.mk
include ../../sysutils/console-bridge/depend.mk
include ../../mk/robotpkg.mk

# fix a crazy circular dependency: tf depends on tf2, and test_tf2 depends on
# tf, so obviously this cannot work...
post-extract:
	${RUN}${RM} -rf ${WRKSRC}/test_tf2
