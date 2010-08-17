# robotpkg depend.mk for:	math/roboptim-core-cfsqp-plugin
# Created:			Thomas Moulard on Tue, 17 Nov 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROBOPTIM_CORE_CFSQP_PLUGIN_DEPEND_MK:=${ROBOPTIM_CORE_CFSQP_PLUGIN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		roboptim-core-cfsqp-plugin
endif

ifeq (+,$(ROBOPTIM_CORE_CFSQP_PLUGIN_DEPEND_MK)) # -------------------------

PREFER.roboptim-core-cfsqp-plugin?=	robotpkg

DEPEND_USE+=		roboptim-core-cfsqp-plugin

SYSTEM_SEARCH.roboptim-core-cfsqp-plugin=\
	include/roboptim/core/plugin/cfsqp.hh

DEPEND_ABI.roboptim-core-cfsqp-plugin?=	roboptim-core-cfsqp-plugin>=0.4
DEPEND_DIR.roboptim-core-cfsqp-plugin?=\
	../../optimization/roboptim-core-cfsqp-plugin

endif # ROBOPTIM_CORE_CFSQP_PLUGIN_DEPEND_MK -------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
