# robotpkg depend.mk for:	devel/ament-cmake-ros
# Created:			Anthony Mallet on Wed,  6 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
AMENT_CMAKE_ROS_DEPEND_MK:=	${AMENT_CMAKE_ROS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ament-cmake-ros
endif

ifeq (+,$(AMENT_CMAKE_ROS_DEPEND_MK)) # ------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ament-cmake-ros

DEPEND_METHOD.ament-cmake-ros?=	build
DEPEND_ABI.ament-cmake-ros?=	ament-cmake-ros>=0
DEPEND_DIR.ament-cmake-ros?=	../../devel/ament-cmake-ros

SYSTEM_SEARCH.ament-cmake-ros=\
  $(call ros2_system_search, ament_cmake_ros)

endif # AMENT_CMAKE_ROS_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
