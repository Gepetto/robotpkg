# robotpkg depend.mk for:	graphics/rcpdf-interface
# Created:			Florent Lamiraux on Tue, 30 Jul 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
RCPDF_INTERFACE_DEPEND_MK:=	${RCPDF_INTERFACE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		rcpdf-interface
endif

ifeq (+,$(RCPDF_INTERFACE_DEPEND_MK)) # --------------------------------------

PREFER.rcpdf-interface?=	robotpkg

DEPEND_USE+=		rcpdf-interface

DEPEND_ABI.rcpdf-interface?=	rcpdf-interface>=0.2
DEPEND_DIR.rcpdf-interface?=	../../graphics/rcpdf-interface

SYSTEM_SEARCH.rcpdf-interface=\
	include/rcpdf_interface/model.hh	\
	include/rcpdf_interface/contact.hh	\
	'lib/pkgconfig/rcpdf_interface.pc:/Version/s/[^0-9.]//gp'

endif # RCPDF_INTERFACE_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
