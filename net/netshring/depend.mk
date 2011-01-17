# robotpkg depend.mk for:	net/netshring
# Created:			Anthony Mallet on Thu, 9 Apr 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
NETSHRING_DEPEND_MK:=	${NETSHRING_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		netshring
endif

ifeq (+,$(NETSHRING_DEPEND_MK)) # ------------------------------------------

PREFER.netshring?=	robotpkg

DEPEND_USE+=		netshring

DEPEND_ABI.netshring?=	netshring>=1.2
DEPEND_DIR.netshring?=	../../net/netshring

SYSTEM_SEARCH.netshring=\
	include/netshring.h						\
	'lib/libnetshring.{a,so}'					\
	'lib/pkgconfig/netshring.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
