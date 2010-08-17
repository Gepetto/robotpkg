# robotpkg depend.mk for:	net/evart-client
# Created:			Anthony Mallet on Tue, 15 Jul 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
EVART_CLIENT_DEPEND_MK:=${EVART_CLIENT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		evart-client
endif

ifeq (+,$(EVART_CLIENT_DEPEND_MK)) # ---------------------------------
PREFER.evart-client?=	robotpkg

DEPEND_USE+=		evart-client

DEPEND_ABI.evart-client?=	evart-client>=1.4
DEPEND_DIR.evart-client?=	../../net/evart-client

SYSTEM_SEARCH.evart-client=\
	bin/evart-client	\
	include/evart-client.h

endif # EVART_CLIENT_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
