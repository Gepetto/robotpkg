# robotpkg Makefile for:	middleware/ros2-rmw-fastrtps
# Created:			Anthony Mallet on Tue, 12 Apr 2022
#

ROS2_PKG=	rmw_fastrtps
ROS2_VERSION=	6.2.1

CATEGORIES=	middleware
ROS2_COMMENT=	Middleware interface using Fast RTPS

ROS2_SUBPKGS=\
  rmw_fastrtps_shared_cpp	\
  rmw_fastrtps_cpp		\
  rmw_fastrtps_dynamic_cpp

include ../../meta-pkgs/ros2-core/Makefile.common

include ../../devel/ros2-rcpputils/depend.mk
include ../../middleware/fastrtps/depend.mk
include ../../middleware/ros2-rmw-dds-common/depend.mk
include ../../sysutils/ros2-tracing/depend.mk
include ../../mk/robotpkg.mk
