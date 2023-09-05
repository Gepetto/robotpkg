# robotpkg Makefile for:	middleware/ros2-rmw-fastrtps
# Created:			Anthony Mallet on Tue, 12 Apr 2022
#

ROS2_PKG=	rmw_fastrtps
ROS2_VERSION=	7.4.0

CATEGORIES=	middleware
ROS2_COMMENT=	Middleware interface using Fast RTPS

ROS2_SUBPKGS=\
  rmw_fastrtps_shared_cpp	\
  rmw_fastrtps_cpp		\
  rmw_fastrtps_dynamic_cpp

include ../../meta-pkgs/ros2-core/Makefile.common

DEPEND_ABI.ros2-tracing= ros2-tracing>=7

include ../../devel/ament-cmake-ros/depend.mk
include ../../devel/ros2-rcpputils/depend.mk
include ../../interfaces/ros2-rosidl-dynamic-typesupport/depend.mk
include ../../interfaces/ros2-rosidl-dynamic-typesupport-fastrtps/depend.mk
include ../../middleware/fastrtps/depend.mk
include ../../middleware/ros2-rmw-dds-common/depend.mk
include ../../sysutils/ros2-tracing/depend.mk
include ../../mk/robotpkg.mk
