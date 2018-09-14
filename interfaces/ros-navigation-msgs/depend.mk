# robotpkg depend.mk for:	interfaces/ros-navigation-msgs
# Created:			Anthony Mallet on Fri, 14 Sep 2018
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_NAVIGATION_MSGS_DEPEND_MK:=	${ROS_NAVIGATION_MSGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-navigation-msgs
endif

ifeq (+,$(ROS_NAVIGATION_MSGS_DEPEND_MK)) # --------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-navigation-msgs?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-navigation-msgs?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=				ros-navigation-msgs
ROS_DEPEND_USE+=			ros-navigation-msgs

DEPEND_ABI.ros+=			ros>=jade
DEPEND_ABI.ros-navigation-msgs?=	ros-navigation-msgs>=1
DEPEND_DIR.ros-navigation-msgs?=	../../interfaces/ros-navigation-msgs

SYSTEM_SEARCH.ros-navigation-msgs=\
  'include/map_msgs/GetMapROI.h'				\
  'include/move_base_msgs/MoveBaseAction.h'			\
  '${PYTHON_SYSLIBSEARCH}/map_msgs/__init__.py'			\
  '${PYTHON_SYSLIBSEARCH}/move_base_msgs/__init__.py'		\
  'lib/pkgconfig/map_msgs.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/move_base_msgs.pc:/Version/s/[^0-9.]//gp'	\
  'share/map_msgs/package.xml:/<version>/s/[^0-9.]//gp'		\
  'share/move_base_msgs/package.xml:/<version>/s/[^0-9.]//gp'

endif # ROS_NAVIGATION_MSGS_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
