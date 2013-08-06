# robotpkg depend.mk for:	hardware/ros-driver-common
# Created:			Séverin Lemaignan on Tue, 06 Aug 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_DRIVER_COMMON_DEPEND_MK:=	${ROS_DRIVER_COMMON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-driver-common
endif

ifeq (+,$(ROS_DRIVER_COMMON_DEPEND_MK)) # ---------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-driver-common?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-driver-common?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-driver-common
ROS_DEPEND_USE+=		ros-driver-common

DEPEND_ABI.ros-driver-common?=	ros-driver-common>=1.4
DEPEND_DIR.ros-driver-common=	../../hardware/ros-driver-common

DEPEND_ABI.ros-driver-common.fuerte += ros-driver-common>=1.4<1.5
DEPEND_ABI.ros-driver-common.groovy += ros-driver-common>=1.6<1.7
DEPEND_ABI.ros-driver-common.hydro += ros-driver-common>=1.6<1.7

SYSTEM_SEARCH.ros-driver-common=\
  'include/driver_base/driver.h'				\
  'include/timestamp_tools/trigger_matcher.h'					\
  'share/driver_base/${ROS_STACKAGE}:/<version>/s/[^0-9.]//gp'	\
  'share/driver_common/${ROS_STACKAGE}:/<version>/s/[^0-9.]//gp'			\
  'share/timestamp_tools/${ROS_STACKAGE}:/<version>/s/[^0-9.]//gp'	\
  'lib/pkgconfig/driver_base.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/timestamp_tools.pc:/Version/s/[^0-9.]//gp'		\

endif # ROS_DRIVER_COMMON_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
