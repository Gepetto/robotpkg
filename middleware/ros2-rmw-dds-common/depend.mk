# robotpkg depend.mk for:	middleware/ros2-rmw-dds-common
# Created:			Anthony Mallet on Mon, 11 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_RMW_DDS_COMMON_DEPEND_MK:=	${ROS2_RMW_DDS_COMMON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-rmw-dds-common
endif

ifeq (+,$(ROS2_RMW_DDS_COMMON_DEPEND_MK)) # --------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-rmw-dds-common

DEPEND_ABI.ros2-rmw-dds-common?=ros2-rmw-dds-common>=2
DEPEND_DIR.ros2-rmw-dds-common?=../../middleware/ros2-rmw-dds-common

SYSTEM_SEARCH.ros2-rmw-dds-common=\
  $(call ros2_system_search, rmw_dds_common)

endif # ROS2_RMW_DDS_COMMON_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
