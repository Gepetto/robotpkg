# robotpkg depend.mk for:	robots/tk3-matlab
# Created:			Anthony Mallet on Mon, 6 Jul 2015
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
MATLAB_GENOMIX_DEPEND_MK:=	${MATLAB_GENOMIX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tk3-matlab
endif

ifeq (+,$(MATLAB_GENOMIX_DEPEND_MK)) # -------------------------------------

DEPEND_USE+=		tk3-matlab
PREFER.tk3-matlab?=	robotpkg

SYSTEM_SEARCH.tk3-matlab=\
  'lib/matlab/+tk3/Contents.m'

DEPEND_ABI.tk3-matlab?=	tk3-matlab
DEPEND_DIR.tk3-matlab?=	../../robots/tk3-matlab

endif # MATLAB_GENOMIX_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
