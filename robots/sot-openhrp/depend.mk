# robotpkg depend.mk for:	robots/sot-openhrp
# Created:			Florent Lamiraux on Sat,  9 Jul 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SOT_OPENHRP_DEPEND_MK:=	${SOT_OPENHRP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sot-openhrp
endif

ifeq (+,$(SOT_OPENHRP_DEPEND_MK)) # --------------------------------------

PREFER.sot-openhrp?=	robotpkg

SYSTEM_SEARCH.sot-openhrp=\


DEPEND_USE+=		sot-openhrp

DEPEND_ABI.sot-openhrp?=	sot-openhrp>=2.5
DEPEND_DIR.sot-openhrp?=	../../robots/sot-openhrp

endif # SOT_OPENHRP_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
