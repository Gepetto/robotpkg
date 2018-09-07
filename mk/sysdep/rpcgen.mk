# robotpkg sysdep/rpcgen.mk
# Created:			Anthony Mallet on Thu,  6 Sep 2018
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
RPCGEN_DEPEND_MK:=	${RPCGEN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		rpcgen
endif

ifeq (+,$(RPCGEN_DEPEND_MK)) # ---------------------------------------------

PREFER.rpcgen?=		system
DEPEND_USE+=		rpcgen
DEPEND_METHOD.rpcgen?=	build
DEPEND_ABI.rpcgen?=	rpcgen

SYSTEM_SEARCH.rpcgen=	\
  'bin/rpcgen'

export RPCGEN=	$(word 1,${SYSTEM_FILES.rpcgen})

endif # RPCGEN_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
