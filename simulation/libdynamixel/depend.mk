# robotpkg depend.mk for:	simulation/libdynamixel
# Created:			Anthony Mallet on Thu, 20 Jul 2023
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
LIBDYNAMIXEL_DEPEND_MK:=	${LIBDYNAMIXEL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libdynamixel
endif

ifeq (+,$(LIBDYNAMIXEL_DEPEND_MK)) # ---------------------------------------

PREFER.libdynamixel?=		robotpkg

SYSTEM_SEARCH.libdynamixel=\
  'include/libdynamixel.h'					\
  'lib/libdynamixel.so'						\
  'lib/pkgconfig/libdynamixel.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=			libdynamixel

DEPEND_ABI.libdynamixel?=	libdynamixel>=1.2
DEPEND_DIR.libdynamixel?=	../../simulation/libdynamixel

endif # LIBDYNAMIXEL_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
