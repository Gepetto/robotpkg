# robotpkg depend.mk for:	devel/ros2-rcl-logging
# Created:			Anthony Mallet on Wed,  6 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_RCL_LOGGING_DEPEND_MK:=	${ROS2_RCL_LOGGING_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-rcl-logging
endif

ifeq (+,$(ROS2_RCL_LOGGING_DEPEND_MK)) # -----------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-rcl-logging

DEPEND_ABI.ros2-rcl-logging?=	ros2-rcl-logging>=0
DEPEND_DIR.ros2-rcl-logging?=	../../devel/ros2-rcl-logging

SYSTEM_SEARCH.ros2-rcl-logging=\
  $(call ros2_system_search,			\
    rcl_logging_interface			\
    rcl_logging_noop				\
    rcl_logging_spdlog)				\
  'lib/librcl_logging_interface.so'		\
  'lib/librcl_logging_noop.so'			\
  'lib/librcl_logging_spdlog.so'		\
  'include/rcl_logging_interface/rcl_logging_interface/rcl_logging_interface.h'

endif # ROS2_RCL_LOGGING_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
