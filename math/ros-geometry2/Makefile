# robotpkg Makefile for:	math/ros-geometry2
# Created:			Anthony Mallet on Tue, 16 May 2017
#

ROS_PKG=	geometry2
ROS_VERSION=	0.6.3
ROS_METAPKG=	yes

CATEGORIES=	math localization
ROS_COMMENT=	packages for keeping track of coordinate transforms

include ../../meta-pkgs/ros-base/Makefile.common

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-cmake-modules/depend.mk
include ../../devel/ros-roscpp-core/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../middleware/ros-actionlib/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../motion/ros-orocos-kinematics-dynamics/depend.mk
include ../../simulation/bullet/depend.mk
include ../../sysutils/console-bridge/depend.mk
include ../../mk/robotpkg.mk

# fix a crazy circular dependency: tf depends on tf2, and test_tf2 depends on
# tf, so obviously this cannot work...
post-extract:
	${RUN}${RM} -rf ${WRKSRC}/test_tf2
