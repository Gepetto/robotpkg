# robotpkg depend.mk for:	devel/ros2-class-loader
# Created:			Anthony Mallet on Wed, 13 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_CLASS_LOADER_DEPEND_MK:=	${ROS2_CLASS_LOADER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-class-loader
endif

ifeq (+,$(ROS2_CLASS_LOADER_DEPEND_MK)) # ----------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-class-loader

DEPEND_ABI.ros2-class-loader?=	ros2-class-loader>=2
DEPEND_DIR.ros2-class-loader?=	../../devel/ros2-class-loader

SYSTEM_SEARCH.ros2-class-loader=\
  $(call ros2_system_search, class_loader)		\
  'include/class_loader/class_loader/class_loader.hpp'	\
  'lib/libclass_loader.so'

endif # ROS2_CLASS_LOADER_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
