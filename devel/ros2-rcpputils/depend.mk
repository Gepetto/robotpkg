# robotpkg depend.mk for:	devel/ros2-rcpputils
# Created:			Anthony Mallet on Wed,  6 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_RCPPUTILS_DEPEND_MK:=	${ROS2_RCPPUTILS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-rcpputils
endif

ifeq (+,$(ROS2_RCPPUTILS_DEPEND_MK)) # -------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-rcpputils

DEPEND_ABI.ros2-rcpputils?=	ros2-rcpputils>=0
DEPEND_DIR.ros2-rcpputils?=	../../devel/ros2-rcpputils

SYSTEM_SEARCH.ros2-rcpputils=\
  $(call ros2_system_search, rcpputils)		\
  'include/{,rcpputils/}rcpputils/asserts.hpp'	\
  'lib/librcpputils.so'

endif # ROS2_RCPPUTILS_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
