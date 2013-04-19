# robotpkg depend.mk for:	interfaces/ros-std-msgs
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_STD_MSGS_DEPEND_MK:=	${ROS_STD_MSGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-std-msgs
endif

ifeq (+,$(ROS_STD_MSGS_DEPEND_MK)) # ---------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-std-msgs?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-std-msgs?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=		ros-std-msgs

DEPEND_ABI.ros-std-msgs?=	ros-std-msgs>=0.4.11
DEPEND_DIR.ros-std-msgs?=	../../interfaces/ros-std-msgs

SYSTEM_SEARCH.ros-std-msgs=\
	include/std_msgs/Int32.h				\
	'${PYTHON_SYSLIBSEARCH}/std_msgs/msg/_Int32.py'		\
	share/common-lisp/ros/std_msgs/msg/Int32.lisp		\
	share/std_msgs/cmake/std_msgs-config.cmake		\
	'share/std_msgs/stack.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/std_msgs.pc:/Version/s/[^0-9.]//gp'

endif # ROS_STD_MSGS_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
