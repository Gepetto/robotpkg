# robotpkg depend.mk for:	interfaces/ros-control-msgs
# Created:			Anthony Mallet on Tue, 23 May 2017
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_CONTROL_MSGS_DEPEND_MK:=		${ROS_CONTROL_MSGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-control-msgs
endif

ifeq (+,$(ROS_CONTROL_MSGS_DEPEND_MK)) # -----------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-control-msgs?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-control-msgs?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=				ros-control-msgs
ROS_DEPEND_USE+=			ros-control-msgs

DEPEND_ABI.ros-control-msgs?=		ros-control-msgs>=1.5<1.6
DEPEND_DIR.ros-control-msgs?=		../../interfaces/ros-control-msgs

DEPEND_ABI.ros-control-msgs.groovy?=	ros-control-msgs>=1.1<1.2
DEPEND_ABI.ros-control-msgs.hydro?=	ros-control-msgs>=1.2<1.3
DEPEND_ABI.ros-control-msgs.indigo?=	ros-control-msgs>=1.3<1.4
DEPEND_ABI.ros-control-msgs.jade?=	ros-control-msgs>=1.3<1.4
DEPEND_ABI.ros-control-msgs.kinetic?=	ros-control-msgs>=1.4<1.6
DEPEND_ABI.ros-control-msgs.lunar?=	ros-control-msgs>=1.4<1.5
DEPEND_ABI.ros-control-msgs.melodic?=	ros-control-msgs>=1.4<1.6

SYSTEM_SEARCH.ros-control-msgs=\
  'include/control_msgs/JointControllerState.h'				\
  '${PYTHON_SYSLIBSEARCH}/control_msgs/msg/_JointControllerState.py'	\
  'share/common-lisp/ros/control_msgs/msg/JointControllerState.lisp'	\
  'share/control_msgs/msg/JointControllerState.msg'			\
  'share/control_msgs/package.xml:/<version>/s/[^0-9.]//gp'		\
  'share/control_msgs/cmake/control_msgsConfig.cmake'			\
  'lib/pkgconfig/control_msgs.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # ROS_CONTROL_MSGS_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
