# robotpkg depend.mk for:	middleware/ros2-rmw-fastrtps
# Created:			Anthony Mallet on Tue, 12 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_RMW_FASTRTPS_DEPEND_MK:=	${ROS2_RMW_FASTRTPS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-rmw-fastrtps
endif

ifeq (+,$(ROS2_RMW_FASTRTPS_DEPEND_MK)) # ----------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-rmw-fastrtps

DEPEND_ABI.ros2-rmw-fastrtps?=	ros2-rmw-fastrtps>=0
DEPEND_DIR.ros2-rmw-fastrtps?=	../../middleware/ros2-rmw-fastrtps

SYSTEM_SEARCH.ros2-rmw-fastrtps=\
  $(call ros2_system_search,	\
    rmw				\
    rmw_implementation_cmake)

endif # ROS2_RMW_FASTRTPS_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
