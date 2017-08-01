# robotpkg depend.mk for:	sysutils/ros-console-bridge
# Created:			Anthony Mallet on Thu, 27 Jun 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_CONSOLE_BRIDGE_DEPEND_MK:=	${ROS_CONSOLE_BRIDGE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				ros-console-bridge
endif

ifeq (+,$(ROS_CONSOLE_BRIDGE_DEPEND_MK)) # ---------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-console-bridge?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-console-bridge?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=				ros-console-bridge
ROS_DEPEND_USE+=			ros-console-bridge

DEPEND_ABI.ros-console-bridge?=		ros-console-bridge>=0.2
DEPEND_DIR.ros-console-bridge?=		../../sysutils/ros-console-bridge

DEPEND_ABI.ros-console-bridge.groovy?=	ros-console-bridge>=0.2<0.3
DEPEND_ABI.ros-console-bridge.hydro?=	ros-console-bridge>=0.3<0.4
DEPEND_ABI.ros-console-bridge.indigo?=	ros-console-bridge>=0.4<0.5
DEPEND_ABI.ros-console-bridge.jade?=	ros-console-bridge>=0.4<0.5
DEPEND_ABI.ros-console-bridge.kinetic?=	ros-console-bridge>=0.4<0.5
DEPEND_ABI.ros-console-bridge.lunar?=	ros-console-bridge>=0.4<0.5

SYSTEM_SEARCH.ros-console-bridge=\
  'include/rosconsole_bridge/bridge.h'				\
  'lib/librosconsole_bridge.so'					\
  'lib/pkgconfig/rosconsole_bridge.pc:/Version/s/[^0-9.]//gp'	\
  'share/rosconsole_bridge/package.xml:/<version>/s/[^0-9.]//gp'

endif # ROS_CONSOLE_BRIDGE_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
