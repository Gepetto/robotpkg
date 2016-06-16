# robotpkg depend.mk for:	optimization/acado
# Created:			florent on Sat, 9 May 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ACADO_DEPEND_MK:=	${ACADO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		acado
endif

ifeq (+,$(ACADO_DEPEND_MK)) # ----------------------------------------------

PREFER.acado?=		robotpkg

DEPEND_USE+=		acado

DEPEND_ABI.acado?=	acado
DEPEND_DIR.acado?=	../../optimization/acado

SYSTEM_SEARCH.acado=\
  'include/acado/acado_toolkit.hpp'	\
  'lib/libacado_toolkit_s.so'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
