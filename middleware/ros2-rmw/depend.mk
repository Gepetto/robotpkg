# robotpkg depend.mk for:	middleware/ros2-rmw
# Created:			Anthony Mallet on Wed,  6 Apr 2022
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS2_RMW_DEPEND_MK:=	${ROS2_RMW_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros2-rmw
endif

ifeq (+,$(ROS2_RMW_DEPEND_MK)) # -------------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=	ros2-rmw

DEPEND_ABI.ros2-rmw?=	ros2-rmw>=0
DEPEND_DIR.ros2-rmw?=	../../middleware/ros2-rmw

SYSTEM_SEARCH.ros2-rmw=\
  $(call ros2_system_search,	\
    rmw				\
    rmw_implementation_cmake)

endif # ROS2_RMW_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
