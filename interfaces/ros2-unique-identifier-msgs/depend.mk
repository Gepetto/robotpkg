# robotpkg depend.mk for:	interfaces/ros2-unique-identifier-msgs
# Created:			Anthony Mallet on Wed,  6 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_UID_MSGS_DEPEND_MK:=	${ROS2_UID_MSGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-uid-msgs
endif

ifeq (+,$(ROS2_UID_MSGS_DEPEND_MK)) # --------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-uid-msgs

DEPEND_ABI.ros2-uid-msgs?=	ros2-unique-identifier-msgs>=0
DEPEND_DIR.ros2-uid-msgs?=	../../interfaces/ros2-unique-identifier-msgs

SYSTEM_SEARCH.ros2-uid-msgs=\
  $(call ros2_system_search, unique_identifier_msgs)

endif # ROS2_UID_MSGS_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
