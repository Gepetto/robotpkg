# robotpkg depend.mk for:	devel/ros2-rcl
# Created:			Anthony Mallet on Tue, 12 Apr 2022
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS2_RCL_DEPEND_MK:=	${ROS2_RCL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros2-rcl
endif

ifeq (+,$(ROS2_RCL_DEPEND_MK)) # -------------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=	ros2-rcl

DEPEND_ABI.ros2-rcl?=	ros2-rcl>=0
DEPEND_DIR.ros2-rcl?=	../../devel/ros2-rcl

SYSTEM_SEARCH.ros2-rcl=\
  $(call ros2_system_search,	\
    rcl_yaml_param_parser	\
    rcl				\
    rcl_action			\
    rcl_lifecycle)		\
  'include/rcl/rcl/rcl.h'	\
  'lib/librcl.so'

endif # ROS2_RCL_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
