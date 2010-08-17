# robotpkg depend.mk for:	optimization/ipopt
# Created:			florent on Sat, 9 May 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
IPOPT_DEPEND_MK:=${IPOPT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	ipopt
endif

ifeq (+,$(IPOPT_DEPEND_MK)) # ------------------------------

PREFER.ipopt?=	robotpkg

DEPEND_USE+=			ipopt

DEPEND_ABI.ipopt?=	ipopt>=3.6.1
DEPEND_DIR.ipopt?=	../../optimization/ipopt

SYSTEM_SEARCH.ipopt=\
	include/coin/config_ipopt.h		\
	lib/libipopt.so

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
