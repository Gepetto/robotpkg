# robotpkg depend.mk for:	motion/sot-dynamic
# Created:			Florent Lamiraux, Thu 7 July 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SOT_DYNAMIC_DEPEND_MK:=	${SOT_DYNAMIC_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sot-dynamic
endif

ifeq (+,$(SOT_DYNAMIC_DEPEND_MK)) # --------------------------------------

PREFER.sot-dynamic?=	robotpkg

SYSTEM_SEARCH.sot-dynamic=\
	include/sot-dynamic/dynamic.h \
	lib/pkgconfig/sot-dynamic.pc \
	lib/plugin/dynamic.so

DEPEND_USE+=		sot-dynamic

DEPEND_ABI.sot-dynamic?=	sot-dynamic>=2.5
DEPEND_DIR.sot-dynamic?=	../../motion/sot-dynamic

endif # SOT_DYNAMIC_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
