# robotpkg sysdep/openthreads.mk
# Created:			Anthony Mallet on Wed, 29 Apr 2015
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
OPENTHREADS_DEPEND_MK:=	${OPENTHREADS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			openthreads
endif

ifeq (+,$(OPENTHREADS_DEPEND_MK)) # ----------------------------------------

PREFER.openthreads?=		system

DEPEND_USE+=			openthreads

DEPEND_ABI.openthreads?=	openthreads>=2

SYSTEM_SEARCH.openthreads=\
  'include/OpenThreads/Thread'						\
  'lib/libOpenThreads.so'						\
  'lib/pkgconfig/openthreads.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.openthreads=		libopenthreads-dev

endif # OPENTHREADS_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
