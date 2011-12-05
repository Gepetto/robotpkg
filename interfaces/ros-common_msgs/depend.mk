# robotpkg depend.mk for:	interfaces/ros-common_msgs
# Created:			Anthony Mallet on Mon, 5 Dec 2011
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_COMMON_MSGS_DEPEND_MK:=	${ROS_COMMON_MSGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-common_msgs
endif

ifeq (+,$(ROS_COMMON_MSGS_DEPEND_MK)) # ------------------------------------

PREFER.ros-common_msgs?=	robotpkg

SYSTEM_SEARCH.ros-common_msgs=\
	common_msgs/stack.xml					\
	common_msgs/actionlib_msgs/manifest.xml			\
	common_msgs/diagnostic_msgs/manifest.xml		\
	common_msgs/geometry_msgs/manifest.xml			\
	common_msgs/nav_msgs/manifest.xml			\
	common_msgs/sensor_msgs/manifest.xml			\
	common_msgs/stereo_msgs/manifest.xml			\
	common_msgs/trajectory_msgs/manifest.xml		\
	common_msgs/visualization_msgs/manifest.xml

DEPEND_USE+=			ros-common_msgs

DEPEND_ABI.ros-common_msgs?=	ros-common_msgs>=1.6.0
DEPEND_DIR.ros-common_msgs?=	../../interfaces/ros-common_msgs

endif # ROS_COMMON_MSGS_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
