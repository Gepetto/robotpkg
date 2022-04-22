# robotpkg depend.mk for:	middleware/fastrtps
# Created:			Anthony Mallet on Mon, 11 Apr 2022
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FASTRTPS_DEPEND_MK:=	${FASTRTPS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		fastrtps
endif

ifeq (+,$(FASTRTPS_DEPEND_MK)) # -------------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=	fastrtps

DEPEND_ABI.fastrtps?=	fastrtps>=1
DEPEND_DIR.fastrtps?=	../../middleware/fastrtps

SYSTEM_SEARCH.fastrtps=\
  'include/fastrtps/config.h:/FASTRTPS_VERSION_STR/s/[^0-9.]//gp'	\
  'lib/libfastrtps.so'							\
  'share/fastrtps/cmake/fastrtps-config.cmake'

include ../../devel/foonathan-memory/depend.mk
include ../../middleware/fastcdr/depend.mk
include ../../mk/sysdep/tinyxml2.mk

endif # FASTRTPS_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
