# robotpkg depend.mk for:	devel/ros2-rcutils
# Created:			Anthony Mallet on Wed,  6 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_RCUTILS_DEPEND_MK:=	${ROS2_RCUTILS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-rcutils
endif

ifeq (+,$(ROS2_RCUTILS_DEPEND_MK)) # ---------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-rcutils

DEPEND_ABI.ros2-rcutils?=	ros2-rcutils>=0
DEPEND_DIR.ros2-rcutils?=	../../devel/ros2-rcutils

SYSTEM_SEARCH.ros2-rcutils=\
  $(call ros2_system_search, rcutils)

endif # ROS2_RCUTILS_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
