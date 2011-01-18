# robotpkg depend.mk for:	middleware/ros-comm
# Created:			Anthony Mallet on Tue, 18 Jan 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_COMM_DEPEND_MK:=	${ROS_COMM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-comm
endif

ifeq (+,$(ROS_COMM_DEPEND_MK)) # -------------------------------------------

PREFER.ros-comm?=	robotpkg

SYSTEM_SEARCH.ros-comm=\
	ros_comm/messages/std_msgs/msg/UInt8.msg

DEPEND_USE+=		ros-comm

DEPEND_ABI.ros-comm?=	ros-comm>=1.4.0
DEPEND_DIR.ros-comm?=	../../middleware/ros-comm

endif # ROS_COMM_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
