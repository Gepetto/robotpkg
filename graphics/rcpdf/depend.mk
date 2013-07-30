# robotpkg depend.mk for:	graphics/rcpdf
# Created:			Florent Lamiraux on Tue, 30 Jul 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
RPCDF_DEPEND_MK:=	${RPCDF_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		rcpdf
endif

ifeq (+,$(RPCDF_DEPEND_MK)) # --------------------------------------

PREFER.rcpdf?=	robotpkg

DEPEND_USE+=		rcpdf

DEPEND_ABI.rcpdf?=	rcpdf>=0.2
DEPEND_DIR.rcpdf?=	../../graphics/rcpdf

SYSTEM_SEARCH.rcpdf=\
	lib/rcpdf/check_rcpdf	\
	lib/librcpdf.so		\
	include/rcpdf/parser.hh	\
	'lib/pkgconfig/rcpdf.pc:/Version/s/[^0-9.]//gp'

endif # RPCDF_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
