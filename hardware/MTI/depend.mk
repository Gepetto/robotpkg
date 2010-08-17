# robotpkg depend.mk for:	hardware/MTI
# Created:			Arnaud Degroote on Thu, 17 Jul 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MTI_DEPEND_MK:=${MTI_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		MTI
endif

ifeq (+,$(MTI_DEPEND_MK))
PREFER.MTI?=	robotpkg

DEPEND_USE+=		MTI

DEPEND_ABI.MTI?=	MTI>=0.4
DEPEND_DIR.MTI?=	../../hardware/MTI

SYSTEM_SEARCH.MTI=\
	include/MTI-clients/MTI.h \
	lib/pkgconfig/MTI-clients.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
