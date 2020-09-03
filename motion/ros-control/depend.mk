# robotpkg depend.mk for:	motion/ros-control
# Created:			Anthony Mallet on Fri, 31 Mar 2017
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_CONTROL_DEPEND_MK:=		${ROS_CONTROL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-control
endif

ifeq (+,$(ROS_CONTROL_DEPEND_MK)) # ----------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-control?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-control?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-control
ROS_DEPEND_USE+=		ros-control

DEPEND_ABI.ros+=		ros>=hydro

DEPEND_ABI.ros-control?=	ros-control>=0.19<0.20
DEPEND_DIR.ros-control?=	../../motion/ros-control

DEPEND_ABI.ros-control.hydro?=	ros-control>=0.7<0.9
DEPEND_ABI.ros-control.indigo?=	ros-control>=0.9<0.10
DEPEND_ABI.ros-control.jade?=	ros-control>=0.10<0.11
DEPEND_ABI.ros-control.kinetic?=ros-control>=0.11<0.14
DEPEND_ABI.ros-control.lunar?=	ros-control>=0.11<0.14
DEPEND_ABI.ros-control.melodic?=ros-control>=0.14<0.18

SYSTEM_SEARCH.ros-control=\
  'include/controller_interface/controller.h'				\
  'include/controller_manager/controller_manager.h'			\
  'include/controller_manager_msgs/ControllerState.h'			\
  'include/hardware_interface/hardware_interface.h'			\
  'include/joint_limits_interface/joint_limits.h'			\
  'include/transmission_interface/robot_transmissions.h'		\
  'lib/libcontroller_manager.so'					\
  'lib/libtransmission_interface_loader.so'				\
  'share/controller_interface/package.xml:/<version>/s/[^0-9.]//gp'	\
  'share/controller_manager/package.xml:/<version>/s/[^0-9.]//gp'	\
  'share/controller_manager_msgs/package.xml:/<version>/s/[^0-9.]//gp'	\
  'share/hardware_interface/package.xml:/<version>/s/[^0-9.]//gp'	\
  'share/joint_limits_interface/package.xml:/<version>/s/[^0-9.]//gp'	\
  'share/ros_control/package.xml:/<version>/s/[^0-9.]//gp'		\
  'share/transmission_interface/package.xml:/<version>/s/[^0-9.]//gp'	\
  'lib/pkgconfig/controller_interface.pc:/Version/s/[^0-9.]//gp'	\
  'lib/pkgconfig/controller_manager.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/hardware_interface.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/joint_limits_interface.pc:/Version/s/[^0-9.]//gp'	\
  'lib/pkgconfig/transmission_interface.pc:/Version/s/[^0-9.]//gp'

endif # ROS_CONTROL_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
