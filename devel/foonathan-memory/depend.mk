# robotpkg depend.mk for:	devel/foonathan-memory
# Created:			Anthony Mallet on Fri,  8 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
FOONATHAN_MEMORY_DEPEND_MK:=	${FOONATHAN-MEMORY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			foonathan-memory
endif

ifeq (+,$(FOONATHAN_MEMORY_DEPEND_MK)) # -----------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		foonathan-memory

DEPEND_METHOD.foonathan-memory?=build
DEPEND_ABI.foonathan-memory?=	foonathan-memory>=0
DEPEND_DIR.foonathan-memory?=	../../devel/foonathan-memory

SYSTEM_SEARCH.foonathan-memory=\
  'include/foonathan_memory/foonathan/memory/config.hpp'		\
  'lib/libfoonathan_memory-*.a:s/.*memory-//;s/.a$$//p:echo %'		\
  'lib/foonathan_memory/cmake/foonathan_memory-config.cmake'

endif # FOONATHAN_MEMORY_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
