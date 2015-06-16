# robotpkg sysdep/mex.mk
# Created:			Anthony Mallet on Tue, 16 Jun 2015
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MEX_DEPEND_MK:=	${MEX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mex
endif

ifeq (+,$(MEX_DEPEND_MK)) # ------------------------------------------------

PREFER.mex?=		system
DEPEND_USE+=		mex

DEPEND_METHOD.mex=	build
DEPEND_ABI.mex?=	mex

SYSTEM_SEARCH.mex=	\
  'bin/mex'

export MEX=	$(word 1,${SYSTEM_FILES.mex})

endif # MEX_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
