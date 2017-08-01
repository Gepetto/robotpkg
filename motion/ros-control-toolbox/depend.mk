# robotpkg depend.mk for:	devel/ros-control-toolbox
# Created:			Anthony Mallet on Thu, 27 Jun 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_CONTROL_TOOLBOX_DEPEND_MK:=	${ROS_CONTROL_TOOLBOX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-control-toolbox
endif

ifeq (+,$(ROS_CONTROL_TOOLBOX_DEPEND_MK)) # --------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-control-toolbox?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-control-toolbox?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=				ros-control-toolbox
ROS_DEPEND_USE+=			ros-control-toolbox

DEPEND_ABI.ros+=ros>=hydro

DEPEND_ABI.ros-control-toolbox?=	ros-control-toolbox>=1.10
DEPEND_DIR.ros-control-toolbox?=	../../motion/ros-control-toolbox

DEPEND_ABI.ros-control-toolbox.hydro?=	ros-control-toolbox>=1.10<1.13
DEPEND_ABI.ros-control-toolbox.indigo?=	ros-control-toolbox>=1.13<1.15
DEPEND_ABI.ros-control-toolbox.jade?=	ros-control-toolbox>=1.13<1.15
DEPEND_ABI.ros-control-toolbox.kinetic?=ros-control-toolbox>=1.15<1.16
DEPEND_ABI.ros-control-toolbox.lunar?=	ros-control-toolbox>=1.15<1.16

SYSTEM_SEARCH.ros-control-toolbox=\
  'include/control_toolbox/ParametersConfig.h'				\
  'share/control_toolbox/package.xml:/<version>/s/[^0-9.]//gp'	\
  'lib/pkgconfig/control_toolbox.pc:/Version/s/[^0-9.]//gp'

endif # ROS_CONTROL_TOOLBOX_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
