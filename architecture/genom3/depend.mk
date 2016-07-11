# robotpkg depend.mk for:	architecture/genom3
# Created:			Anthony Mallet on Fri, 19 Oct 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GENOM3_DEPEND_MK:=	${GENOM3_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		genom3
endif

ifeq (+,$(GENOM3_DEPEND_MK)) # ---------------------------------------------

DEPEND_USE+=		genom3
PREFER.genom3?=		robotpkg

SYSTEM_SEARCH.genom3=\
  'bin/genom3:p:% --version'		\
  'include/genom3/c/client.h'		\
  'lib/pkgconfig/genom3.pc:/Version/s/[^0-9.]//gp'

DEPEND_ABI.genom3?=	genom3>=2.99.28
DEPEND_DIR.genom3?=	../../architecture/genom3

export GENOM3=	${PREFIX.genom3}/bin/genom3

endif # GENOM3_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
