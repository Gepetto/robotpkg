# robotpkg depend.mk for:	devel/ros2-rclpy
# Created:			Anthony Mallet on Wed, 13 Apr 2022
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS2_RCLPY_DEPEND_MK:=	${ROS2_RCLPY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros2-rclpy
endif

ifeq (+,$(ROS2_RCLPY_DEPEND_MK)) # -----------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=	ros2-rclpy

DEPEND_ABI.ros2-rclpy?=	ros2-rclpy>=0
DEPEND_DIR.ros2-rclpy?=	../../devel/ros2-rclpy

SYSTEM_SEARCH.ros2-rclpy=\
  $(call ros2_system_search, rclpy)		\
  '${PYTHON_SITELIB}/rclpy/__init__.py'

include ../../mk/sysdep/python.mk

endif # ROS2_RCLPY_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
