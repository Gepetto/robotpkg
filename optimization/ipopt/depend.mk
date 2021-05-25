# robotpkg depend.mk for:	optimization/ipopt
# Created:			florent on Sat, 9 May 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
IPOPT_DEPEND_MK:=		${IPOPT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ipopt
endif

ifeq (+,$(IPOPT_DEPEND_MK)) # ------------------------------

PREFER.ipopt?=			system

DEPEND_USE+=			ipopt

DEPEND_ABI.ipopt?=		ipopt>=3.11.9
DEPEND_DIR.ipopt?=		../../optimization/ipopt

SYSTEM_SEARCH.ipopt=\
	'include/coin{,-or}/IpoptConfig.h:/IPOPT_VERSION/s/[^0-9.]//gp'	\
	lib/libipopt.so

endif # --------------------------------------------------------------------

SYSTEM_PKG.Arch.ipopt=		coin-or-ipopt (AUR)
SYSTEM_PKG.Debian.ipopt=	coinor-libipopt-dev coinor-libipopt1v5

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
