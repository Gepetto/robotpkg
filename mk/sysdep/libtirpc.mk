# robotpkg sysdep/libtirpc.mk
# Created:			Anthony Mallet on Sep 7 2018

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBTIRPC_DEPEND_MK:=	${LIBTIRPC_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libtirpc
endif

ifeq (+,$(LIBTIRPC_DEPEND_MK)) # -------------------------------------------

PREFER.libtirpc?=	system
DEPEND_USE+=		libtirpc
DEPEND_ABI.libtirpc?=	libtirpc>=1

SYSTEM_SEARCH.libtirpc=	\
  'include/tirpc/rpc/rpc.h'				\
  'lib/libtirpc.so'					\
  'lib/pkgconfig/libtirpc.pc:/Version/s/[^.0-9]//gp'

SYSTEM_PKG.Debian.libtirpc=	libtirpc-dev
SYSTEM_PKG.RedHat.libtirpc=	libtirpc-devel

endif # LIBTIRPC_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
