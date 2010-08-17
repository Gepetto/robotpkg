# robotpkg depend.mk for:	optimization/roboptim-core-ipopt-plugin
# Created:			florent on Sat, 9 May 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROBOPTIM_CORE_IPOPT_PLUGIN_DEPEND_MK:=${ROBOPTIM_CORE_IPOPT_PLUGIN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	roboptim-core-ipopt-plugin
endif

ifeq (+,$(ROBOPTIM_CORE_IPOPT_PLUGIN_DEPEND_MK)) # -------------------------

PREFER.roboptim-core-ipopt-plugin?=	robotpkg

DEPEND_USE+=			roboptim-core-ipopt-plugin

DEPEND_ABI.roboptim-core-ipopt-plugin?=	roboptim-core-ipopt-plugin>=0.2
DEPEND_DIR.roboptim-core-ipopt-plugin?=	../../optimization/roboptim-core-ipopt-plugin

SYSTEM_SEARCH.roboptim-core-ipopt-plugin=\
	include/roboptim-core-ipopt-plugin/fwd.hh		\
	'lib/pkgconfig/roboptim-core-ipopt-plugin.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
