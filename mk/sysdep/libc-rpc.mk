# robotpkg sysdep/libc-rpc.mk
# Created:			Anthony Mallet on Sep 7 2018

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBC-RPC_DEPEND_MK:=	${LIBC-RPC_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libc-rpc
endif

ifeq (+,$(LIBC-RPC_DEPEND_MK)) # -------------------------------------------

PREFER.libc-rpc?=	system
DEPEND_USE+=		libc-rpc
DEPEND_ABI.libc-rpc?=	libc-rpc

SYSTEM_SEARCH.libc-rpc=	\
  'include/rpc/rpc.h'

SYSTEM_PKG.Debian.libc-rpc=	libc6-dev

endif # LIBC-RPC_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
