# robotpkg depend.mk for:	middleware/ros-comm
# Created:			Anthony Mallet on Tue, 18 Jan 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_COMM_DEPEND_MK:=	${ROS_COMM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-comm
endif

ifeq (+,$(ROS_COMM_DEPEND_MK)) # -------------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-comm?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-comm?=${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=		ros-comm

DEPEND_ABI.ros-comm?=	ros-comm>=1.9<1.10
DEPEND_DIR.ros-comm?=	../../middleware/ros-comm

SYSTEM_SEARCH.ros-comm=\
	bin/roscore							\
	include/ros/ros.h						\
	lib/libroscpp.so						\
	'share/ros_comm/package.xml:/<version>/s/[^0-9.]//gp'		\
	'lib/pkgconfig/rosnode.pc:/Version/s/[^0-9.]//gp'

endif # ROS_COMM_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
