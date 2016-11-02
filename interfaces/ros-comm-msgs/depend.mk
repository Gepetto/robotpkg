# robotpkg Makefile for:	interfaces/ros-comm-msgs
# Created:			Anthony Mallet on Wed, 13 Aug 2014
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_COMM_MSGS_DEPEND_MK:=${ROS_COMM_MSGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-comm-msgs
endif

ifeq (+,$(ROS_COMM_MSGS_DEPEND_MK)) # --------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-comm-msgs?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-comm-msgs?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-comm-msgs
ROS_DEPEND_USE+=		ros-comm-msgs

DEPEND_ABI.ros+=		ros>=indigo

DEPEND_ABI.ros-comm-msgs?=	ros-comm-msgs>=1.10.3
DEPEND_DIR.ros-comm-msgs?=	../../interfaces/ros-comm-msgs

SYSTEM_SEARCH.ros-comm-msgs=\
	include/rosgraph_msgs/Log.h					\
	'${PYTHON_SYSLIBSEARCH}/rosgraph_msgs/msg/_Log.py'		\
	share/common-lisp/ros/rosgraph_msgs/msg/Log.lisp		\
	'share/rosgraph_msgs/package.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/rosgraph_msgs.pc:/Version/s/[^0-9.]//gp'

endif # ROS_COMM_MSGS_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
