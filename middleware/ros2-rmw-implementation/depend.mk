# robotpkg depend.mk for:	middleware/ros2-rmw-implementation
# Created:			Anthony Mallet on Tue, 12 Apr 2022
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
ROS2_RMW_IMPLEMENTATION_DEPEND_MK:=	${ROS2_RMW_IMPLEMENTATION_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				ros2-rmw-implementation
endif

ifeq (+,$(ROS2_RMW_IMPLEMENTATION_DEPEND_MK)) # ----------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=			ros2-rmw-implementation

DEPEND_ABI.ros2-rmw-implementation?=	ros2-rmw-implementation>=0
DEPEND_DIR.ros2-rmw-implementation?=	../../middleware/ros2-rmw-implementation

SYSTEM_SEARCH.ros2-rmw-implementation=\
  $(call ros2_system_search,		\
    rmw_implementation			\
    test_rmw_implementation)

endif # ROS2_RMW_IMPLEMENTATION_DEPEND_MK ----------------------------------

DEPEND_DEPTH:=				${DEPEND_DEPTH:+=}
