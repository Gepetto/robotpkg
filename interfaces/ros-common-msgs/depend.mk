# robotpkg depend.mk for:	interfaces/ros-common-msgs
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_COMMON_MSGS_DEPEND_MK:=	${ROS_COMMON_MSGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-common-msgs
endif

ifeq (+,$(ROS_COMMON_MSGS_DEPEND_MK)) # ------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-common-msgs?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-common-msgs?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-common-msgs

DEPEND_ABI.ros-common-msgs?=	ros-common-msgs>=1.9<1.10
DEPEND_DIR.ros-common-msgs?=	../../interfaces/ros-common-msgs

SYSTEM_SEARCH.ros-common-msgs=\
	include/actionlib_msgs/GoalID.h					\
	'${PYTHON_SYSLIBSEARCH}/actionlib_msgs/msg/_GoalID.py'		\
	share/common-lisp/ros/actionlib_msgs/msg/GoalID.lisp		\
	share/actionlib_msgs/msg/GoalID.msg				\
	'share/common_msgs/package.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/actionlib_msgs.pc:/Version/s/[^0-9.]//gp'	\
	'lib/pkgconfig/diagnostic_msgs.pc:/Version/s/[^0-9.]//gp'	\
	'lib/pkgconfig/geometry_msgs.pc:/Version/s/[^0-9.]//gp'		\
	'lib/pkgconfig/nav_msgs.pc:/Version/s/[^0-9.]//gp'		\
	'lib/pkgconfig/sensor_msgs.pc:/Version/s/[^0-9.]//gp'		\
	'lib/pkgconfig/shape_msgs.pc:/Version/s/[^0-9.]//gp'		\
	'lib/pkgconfig/stereo_msgs.pc:/Version/s/[^0-9.]//gp'		\
	'lib/pkgconfig/trajectory_msgs.pc:/Version/s/[^0-9.]//gp'	\
	'lib/pkgconfig/visualization_msgs.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # ROS_COMMON_MSGS_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
