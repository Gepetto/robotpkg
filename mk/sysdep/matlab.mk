# robotpkg sysdep/matlab.mk
# Created:			Anthony Mallet on Tue,  1 Mar 2016
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MATLAB_DEPEND_MK:=	${MATLAB_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		matlab
endif

ifeq (+,$(MATLAB_DEPEND_MK)) # --------------------------------------

SYSTEM_PREFIX.matlab?=	/opt/matlab /usr/local/matlab ${SYSTEM_PREFIX}

PREFER.matlab?=		system
DEPEND_USE+=		matlab

DEPEND_ABI.matlab?=	matlab

SYSTEM_SEARCH.matlab=\
  'bin/matlab'			\
  'extern/include/mex.h'

endif # MATLAB_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
