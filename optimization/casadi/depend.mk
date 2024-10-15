# robotpkg depend.mk for:	optimization/casadi
# Created:			Guilhem Saurel on Tue, 14 Oct 2024
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
CASADI_DEPEND_MK:=	${CASADI_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		casadi
endif

ifeq (+,$(CASADI_DEPEND_MK)) # ------------------------------------------

PREFER.casadi?=		robotpkg

SYSTEM_SEARCH.casadi=\
  'include/casadi/config.h:/CASADI_VERSION_STRING/s/[^0-9.]//gp'	\
  'lib/libcasadi.so'

DEPEND_USE+=		casadi

DEPEND_ABI.casadi?=	casadi>=3.4.5
DEPEND_DIR.casadi?=	../../optimization/casadi


endif # CASADI_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
