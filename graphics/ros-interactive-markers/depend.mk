# robotpkg depend.mk for:	graphics/ros-interactive-markers
# Created:			Charles Lesire on Tue, 8 Apr 2014
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_INTERACTIVE_MARKERS_DEPEND_MK:=${ROS_INTERACTIVE_MARKERS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-interactive-markers
endif

ifeq (+,$(ROS_INTERACTIVE_MARKERS_DEPEND_MK)) # ----------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-interactive-markers?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-interactive-markers?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-interactive-markers
ROS_DEPEND_USE+=		ros-interactive-markers

DEPEND_ABI.ros+=		ros>=groovy
DEPEND_ABI.ros-interactive-markers?=	ros-interactive-markers>=1.9
DEPEND_DIR.ros-interactive-markers?=	../../graphics/ros-interactive-markers

DEPEND_ABI.ros-interactive-markers.groovy?= ros-interactive-markers>=1.9<1.10
DEPEND_ABI.ros-interactive-markers.hydro?=  ros-interactive-markers>=1.10<1.11
DEPEND_ABI.ros-interactive-markers.indigo?= ros-interactive-markers>=1.11<1.12
DEPEND_ABI.ros-interactive-markers.jade?=   ros-interactive-markers>=1.11<1.12
DEPEND_ABI.ros-interactive-markers.kinetic?=ros-interactive-markers>=1.11<1.12

SYSTEM_SEARCH.ros-interactive-markers=\
  'include/interactive_markers/tools.h'					\
  'lib/libinteractive_markers.so'					\
  '${PYTHON_SYSLIBSEARCH}/interactive_markers/__init__.py'		\
  'lib/pkgconfig/interactive_markers.pc:/Version/s/[^0-9.]//gp'		\
  'share/interactive_markers/package.xml:/<version>/s/[^0-9.]//gp'

endif # ROS_INTERACTIVE_MARKERS_DEPEND_MK ----------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
