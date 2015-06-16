# robotpkg depend.mk for:	supervision/matlab-genomix
# Created:			Anthony Mallet on Tue, 16 Jun 2015
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
MATLAB_GENOMIX_DEPEND_MK:=	${MATLAB_GENOMIX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		matlab-genomix
endif

ifeq (+,$(MATLAB_GENOMIX_DEPEND_MK)) # -------------------------------------

DEPEND_USE+=		matlab-genomix
PREFER.matlab-genomix?=	robotpkg

SYSTEM_SEARCH.matlab-genomix=\
  'lib/matlab/+genomix/Contents.m'

DEPEND_ABI.matlab-genomix?=	matlab-genomix
DEPEND_DIR.matlab-genomix?=	../../supervision/matlab-genomix

endif # MATLAB_GENOMIX_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
