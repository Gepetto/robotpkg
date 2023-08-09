# robotpkg depend.mk for:	sysutils/ros-console
# Created:			Anthony Mallet on Tue,  4 Sep 2018
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_CONSOLE_DEPEND_MK:=		${ROS_CONSOLE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-console
endif

ifeq (+,$(ROS_CONSOLE_DEPEND_MK)) # ----------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-console?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-console?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-console
ROS_DEPEND_USE+=		ros-console

DEPEND_DIR.ros-console?=	../../sysutils/ros-console
DEPEND_ABI.ros-console?=	ros-console>=1.13

SYSTEM_SEARCH.ros-console=\
  'include/ros/console.h'				\
  'lib/librosconsole.so'				\
  'lib/pkgconfig/rosconsole.pc:/Version/s/[^0-9.]//gp'	\
  'share/rosconsole/cmake/rosconsoleConfig.cmake'	\
  'share/rosconsole/package.xml:/<version>/s/[^0-9.]//gp'

SYSTEM_PKG.Ubuntu.ros-console=	ros-${PKG_ALTERNATIVE.ros}-rosconsole

endif # ROS_CONSOLE_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
