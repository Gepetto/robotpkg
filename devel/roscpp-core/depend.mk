# robotpkg depend.mk for:	devel/roscpp-core
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROSCPP_CORE_DEPEND_MK:=	${ROSCPP_CORE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		roscpp-core
endif

ifeq (+,$(ROSCPP_CORE_DEPEND_MK)) # ----------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.roscpp-core?=		${PREFER.ros-base}
SYSTEM_PREFIX.roscpp-core?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=		roscpp-core

DEPEND_ABI.roscpp-core?=roscpp-core>=0.2.6
DEPEND_DIR.roscpp-core?=../../devel/roscpp-core

SYSTEM_SEARCH.roscpp-core=\
  include/ros/types.h							\
  lib/libcpp_common.so							\
  share/cpp_common/cmake/cpp_common-config.cmake			\
  share/roscpp_serialization/cmake/roscpp_serialization-config.cmake	\
  share/rostime/cmake/rostime-config.cmake				\
  share/roscpp_traits/cmake/roscpp_traits-config.cmake			\
  'lib/pkgconfig/cpp_common.pc:/Version/s/[^0-9.]//gp'

endif # ROSCPP_CORE_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
