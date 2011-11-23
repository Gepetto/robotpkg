# robotpkg depend.mk for:	middleware/ros-core
# Created:			Anthony Mallet on Wed, 19 Jan 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_CORE_DEPEND_MK:=	${ROS_CORE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-core
endif

ifeq (+,$(ROS_CORE_DEPEND_MK)) # -------------------------------------------

PREFER.ros-core?=	robotpkg

SYSTEM_SEARCH.ros-core=\
	ros/bin/roscore

DEPEND_USE+=		ros-core

DEPEND_ABI.ros-core?=	ros-core>=1.6.0
DEPEND_DIR.ros-core?=	../../middleware/ros-core

endif # ROS_CORE_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
