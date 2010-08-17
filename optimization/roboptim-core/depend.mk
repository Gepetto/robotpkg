# robotpkg depend.mk for:	optimization/roboptim-core
# Created:			florent@laas.fr on Wed, 29 Apr 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROBOPTIM_CORE_DEPEND_MK:=${ROBOPTIM_CORE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	roboptim-core
endif

ifeq (+,$(ROBOPTIM_CORE_DEPEND_MK)) # ------------------------------

PREFER.roboptim-core?=	robotpkg

DEPEND_USE+=			roboptim-core

DEPEND_ABI.roboptim-core?=	roboptim-core>=0.4
DEPEND_DIR.roboptim-core?=	../../optimization/roboptim-core

SYSTEM_SEARCH.roboptim-core=\
	include/roboptim/core/fwd.hh		\
	'lib/pkgconfig/roboptim-core.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
