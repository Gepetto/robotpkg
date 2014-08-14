# robotpkg depend.mk for:	math/ros-random-numbers
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_RANDOM_NUMBERS_DEPEND_MK:=	${ROS_RANDOM_NUMBERS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-random-numbers
endif

ifeq (+,$(ROS_RANDOM_NUMBERS_DEPEND_MK)) # ---------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-random-numbers?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-random-numbers?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=				ros-random-numbers
ROS_DEPEND_USE+=			ros-random-numbers

DEPEND_ABI.ros-random-numbers?=		ros-random-numbers>=0.1
DEPEND_DIR.ros-random-numbers?=		../../math/ros-random-numbers

SYSTEM_SEARCH.ros-random-numbers=\
  'include/random_numbers/random_numbers.h'				\
  'lib/librandom_numbers.so'						\
  'share/random_numbers/package.xml:/<version>/s/[^0-9.]//gp'		\
  'lib/pkgconfig/random_numbers.pc:/Version/s/[^0-9.]//gp'

endif # ROS_RANDOM_NUMBERS_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
