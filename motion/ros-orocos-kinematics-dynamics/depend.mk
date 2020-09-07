# robotpkg depend.mk for:	motion/ros-orocos-kinematics-dynamics
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_OROCOS_KDL_DEPEND_MK:=	${ROS_OROCOS_KDL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-orocos-kinematics-dynamics
endif

ifeq (+,$(ROS_OROCOS_KDL_DEPEND_MK)) # -------------------------------------

# this package is deprecated
DEPEND_ABI.ros+=	ros<noetic

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-orocos-kinematics-dynamics?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-orocos-kinematics-dynamics?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-orocos-kinematics-dynamics
ROS_DEPEND_USE+=		ros-orocos-kinematics-dynamics

DEPEND_ABI.ros+=		ros>=groovy

DEPEND_ABI.ros-orocos-kinematics-dynamics?=\
  ros-orocos-kinematics-dynamics>=1.1
DEPEND_DIR.ros-orocos-kinematics-dynamics?=\
  ../../motion/ros-orocos-kinematics-dynamics

SYSTEM_SEARCH.ros-orocos-kinematics-dynamics=\
  'share/orocos_kinematics_dynamics/package.xml:/<version>/s/[^0-9.]//gp'

include ../../motion/orocos-kdl/depend.mk

endif # ROS_OROCOS_KDL_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
