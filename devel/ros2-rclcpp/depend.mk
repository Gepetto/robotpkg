# robotpkg depend.mk for:	devel/ros2-rclcpp
# Created:			Anthony Mallet on Wed, 13 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_RCLCPP_DEPEND_MK:=		${ROS2_RCLCPP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-rclcpp
endif

ifeq (+,$(ROS2_RCLCPP_DEPEND_MK)) # ----------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-rclcpp

DEPEND_ABI.ros2-rclcpp?=	ros2-rclcpp>=0
DEPEND_DIR.ros2-rclcpp?=	../../devel/ros2-rclcpp

SYSTEM_SEARCH.ros2-rclcpp=\
  $(call ros2_system_search,		\
    rclcpp				\
    rclcpp_action			\
    rclcpp_components			\
    rclcpp_lifecycle)			\
  'include/rclcpp/rclcpp/node.hpp'	\
  'lib/libcomponent_manager.so'		\
  'lib/librclcpp.so'			\
  'lib/librclcpp_action.so'		\
  'lib/librclcpp_lifecycle.so'

endif # ROS2_RCLCPP_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
