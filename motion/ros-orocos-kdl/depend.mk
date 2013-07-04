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

DEPEND_ABI.ros-orocos-kdl?=	ros-orocos-kdl>=1.1
DEPEND_DIR.ros-orocos-kdl?=	../../motion/ros-orocos-kdl

SYSTEM_SEARCH.ros-orocos-kdl=\
  'include/orocos_kdl/kdl/kdl.hpp'				\
  'lib/liborocos-kdl.so'					\
  'share/orocos_kdl/package.xml:/<version>/s/[^0-9.]//gp'	\
  'lib/pkgconfig/orocos_kdl.pc:/Version/s/[^0-9.]//gp'

endif # ROS_OROCOS_KDL_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
