# robotpkg depend.mk for:	motion/ros-orocos-kdl
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_OROCOS_KDL_DEPEND_MK:=	${ROS_OROCOS_KDL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-orocos-kdl
endif

ifeq (+,$(ROS_OROCOS_KDL_DEPEND_MK)) # -------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-orocos-kdl?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-orocos-kdl?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-orocos-kdl
ROS_DEPEND_USE+=		ros-orocos-kdl

DEPEND_ABI.ros+=		ros>=groovy

DEPEND_ABI.ros-orocos-kdl?=	ros-orocos-kdl>=1.1
DEPEND_DIR.ros-orocos-kdl?=	../../motion/ros-orocos-kdl

SYSTEM_SEARCH.ros-orocos-kdl=\
  'share/orocos_kinematics_dynamics/package.xml:/<version>/s/[^0-9.]//gp'

include ../../motion/orocos-kdl/depend.mk

endif # ROS_OROCOS_KDL_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
