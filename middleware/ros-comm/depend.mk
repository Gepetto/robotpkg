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

DEPEND_USE+=		ros-comm

DEPEND_ABI.ros-comm?=	ros-comm>=1.8.15<1.9
DEPEND_DIR.ros-comm?=	../../middleware/ros-comm

SYSTEM_SEARCH.ros-comm=\
	bin/roscore							\
	include/ros/common.h						\
	lib/libroscpp.so						\
	share/rosbag/cmake/rosbag-config.cmake				\
	share/rosconsole/cmake/rosconsole-config.cmake			\
	share/roscpp/cmake/roscpp-config.cmake				\
	share/rosgraph_msgs/cmake/rosgraph_msgs-config.cmake		\
	share/roslisp/cmake/roslisp-config.cmake			\
	share/rosout/cmake/rosout-config.cmake				\
	share/rostest/cmake/rostest-config.cmake			\
	share/xmlrpcpp/cmake/xmlrpcpp-config.cmake			\
	'share/ros_comm/stack.xml:/<version>/s/[^0-9.]//gp'		\
	'lib/pkgconfig/std_srvs.pc:/Version/s/[^0-9.]//gp'

include ../../devel/roscpp-core/depend.mk

endif # ROS_COMM_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
