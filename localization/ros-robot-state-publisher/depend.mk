# robotpkg depend.mk for:	localization/ros-robot-state-publisher
# Created:			Séverin Lemaignan on Tue, 06 Aug 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_ROBOT_STATE_PUBLISHER_DEPEND_MK:=	${ROS_ROBOT_STATE_PUBLISHER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-robot-state-publisher
endif

ifeq (+,$(ROS_ROBOT_STATE_PUBLISHER_DEPEND_MK)) # --------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-robot-state-publisher?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-robot-state-publisher?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-robot-state-publisher
ROS_DEPEND_USE+=		ros-robot-state-publisher

DEPEND_ABI.ros-robot-state-publisher?=	ros-robot-state-publisher>=1.9
DEPEND_DIR.ros-robot-state-publisher=\
  ../../localization/ros-robot-state-publisher

SYSTEM_SEARCH.ros-robot-state-publisher=\
  'include/robot_state_publisher/robot_state_publisher.h'		\
  'lib/robot_state_publisher/robot_state_publisher'			\
  'share/robot_state_publisher/package.xml:/<version>/s/[^0-9.]//gp'	\
  'lib/pkgconfig/robot_state_publisher.pc:/Version/s/[^0-9.]//gp'

endif # ROS_ROBOT_STATE_PUBLISHER_DEPEND_MK --------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
