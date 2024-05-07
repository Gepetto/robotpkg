# robotpkg depend.mk for:	middleware/fastcdr
# Created:			Anthony Mallet on Tue,  5 Apr 2022
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FASTCDR_DEPEND_MK:=	${FASTCDR_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		fastcdr
endif

ifeq (+,$(FASTCDR_DEPEND_MK)) # --------------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=	fastcdr

DEPEND_ABI.fastcdr?=	fastcdr>=1.1
DEPEND_DIR.fastcdr?=	../../middleware/fastcdr

SYSTEM_SEARCH.fastcdr=\
  'include/fastcdr{,/fastcdr}/Cdr.h'						\
  'lib/libfastcdr.so'							\
  'lib/cmake/fastcdr/fastcdr-config.cmake:/fastcdr_VERSION/s/[^0-9.]//gp'

endif # FASTCDR_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
