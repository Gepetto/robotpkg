# robotpkg depend.mk for:	devel/swig
# Created:			Anthony Mallet on Thu,  7 Jul 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SWIG_DEPEND_MK:=	${SWIG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		swig
endif

ifeq (+,$(SWIG_DEPEND_MK)) # -----------------------------------------

PREFER.swig?=		system

DEPEND_USE+=		swig
DEPEND_ABI.swig?=	swig>=1.3
DEPEND_DIR.swig=	devel/swig
DEPEND_METHOD.swig+=	build

SYSTEM_SEARCH.swig=	'bin/swig:/Version/{s/[^.0-9]//gp;q;}:% -version'

export SWIG=		$(word 1,${SYSTEM_FILES.swig})

endif # SWIG_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
