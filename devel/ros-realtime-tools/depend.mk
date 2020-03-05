# robotpkg depend.mk for:	devel/ros-realtime-tools
# Created:			Aurelie Clodic on Thu, 28 Nov 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_REALTIMETOOLS_DEPEND_MK:=	${ROS_REALTIMETOOLS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-realtime-tools
endif

ifeq (+,$(ROS_REALTIMETOOLS_DEPEND_MK)) # ----------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-realtime-tools?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-realtime-tools?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-realtime-tools
ROS_DEPEND_USE+=		ros-realtime-tools

DEPEND_ABI.ros+=ros>=hydro

DEPEND_ABI.ros-realtime-tools?=	ros-realtime-tools>=1.8.2
DEPEND_DIR.ros-realtime-tools?=	../../devel/ros-realtime-tools

SYSTEM_SEARCH.ros-realtime-tools=\
  'include/realtime_tools/realtime_box.h'			\
  'share/realtime_tools/package.xml:/<version>/s/[^0-9.]//gp'	\
  'lib/pkgconfig/realtime_tools.pc:/Version/s/[^0-9.]//gp'

include ../../mk/language/c++11.mk

endif # ROS_REALTIMETOOLS_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
