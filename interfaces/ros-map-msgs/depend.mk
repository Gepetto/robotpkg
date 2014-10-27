# robotpkg depend.mk for:	interfaces/ros-map-msgs
# Created:			Anthony Mallet on Mon, 27 Oct 2014
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_MAP_MSGS_DEPEND_MK:=	${ROS_MAP_MSGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-map-msgs
endif

ifeq (+,$(ROS_MAP_MSGS_DEPEND_MK)) # ---------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-map-msgs?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-map-msgs?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-map-msgs
ROS_DEPEND_USE+=		ros-map-msgs

DEPEND_ABI.ros+=		ros>=groovy
DEPEND_ABI.ros-map-msgs?=	ros-map-msgs>=0
DEPEND_DIR.ros-map-msgs?=	../../interfaces/ros-map-msgs

SYSTEM_SEARCH.ros-map-msgs=\
  'include/map_msgs/GetMapROI.h'			\
  '${PYTHON_SYSLIBSEARCH}/map_msgs/__init__.py'		\
  'lib/pkgconfig/map_msgs.pc:/Version/s/[^0-9.]//gp'	\
  'share/map_msgs/package.xml:/<version>/s/[^0-9.]//gp'

endif # ROS_MAP_MSGS_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
