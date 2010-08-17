# robotpkg depend.mk for:	localization/odokit
# Created:			Anthony Mallet on Tue, 17 Jun 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ODOKIT_DEPEND_MK:=	${ODOKIT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		odokit
endif

ifeq (+,$(ODOKIT_DEPEND_MK))
PREFER.odokit?=	robotpkg

DEPEND_USE+=		odokit

DEPEND_ABI.odokit?=	odokit>=1.0
DEPEND_DIR.odokit?=	../../localization/odokit

SYSTEM_SEARCH.odokit=\
	include/odokit/odometer.h \
	lib/pkgconfig/odokit.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
