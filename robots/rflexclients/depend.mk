 $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
RFLEXCLIENTS_DEPEND_MK:=${RFLEXCLIENTS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		rflexclients
endif

ifeq (+,$(RFLEXCLIENTS_DEPEND_MK))
PREFER.rflexclients?=	robotpkg

DEPEND_USE+=		rflexclients

DEPEND_ABI.rflexclients?=	rflexclients>=1.0.1
DEPEND_DIR.rflexclients?=	../../robots/rflexclients

DEPEND_PKG_CONFIG.rflexclients+=lib/pkgconfig

SYSTEM_SEARCH.rflexclients=\
	bin/rflexComm \
	include/rflexclients/rFlex.h \
	lib/pkgconfig/rflexclients.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
