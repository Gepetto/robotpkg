# robotpkg depend.mk for:	hardware/sickLib
# Created:			Anthony Mallet on Tue, 17 Jun 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SICKLIB_DEPEND_MK:=${SICKLIB_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sickLib
endif

ifeq (+,$(SICKLIB_DEPEND_MK))
PREFER.sickLib?=	robotpkg

DEPEND_USE+=		sickLib

DEPEND_ABI.sickLib?=	sickLib>=1.0.1
DEPEND_DIR.sickLib?=	../../hardware/sickLib

SYSTEM_SEARCH.sickLib=\
	include/sicklib/sick_lib.h \
	lib/pkgconfig/sicklib.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
