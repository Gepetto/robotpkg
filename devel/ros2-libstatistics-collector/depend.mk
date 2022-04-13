# robotpkg depend.mk for:	devel/ros2-libstatistics-collector
# Created:			Anthony Mallet on Wed, 13 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_LIBSTAT_COLLECT_DEPEND_MK:=${ROS2_LIBSTAT_COLLECT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-libstat-collect
endif

ifeq (+,$(ROS2_LIBSTAT_COLLECT_DEPEND_MK)) # -------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-libstat-collect

DEPEND_ABI.ros2-libstat-collect?=ros2-libstatistics-collector>=0
DEPEND_DIR.ros2-libstat-collect?=../../devel/ros2-libstatistics-collector

SYSTEM_SEARCH.ros2-libstat-collect=\
  $(call ros2_system_search, libstatistics_collector)		\
  'lib/liblibstatistics_collector.so'				\
  'include/libstatistics_collector/libstatistics_collector/visibility_control.hpp'

endif # ROS2_LIBSTAT_COLLECT_DEPEND_MK -------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
