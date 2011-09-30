# robotpkg depend.mk for:	robots/hrp2-builder
# Created:			florent on Fri, 30 Oct 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HRP2_BUILDER_DEPEND_MK:=${HRP2_BUILDER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			hrp2-builder
endif

ifeq (+,$(HRP2_BUILDER_DEPEND_MK)) # ---------------------------------------

PREFER.hrp2-builder?=		robotpkg

SYSTEM_SEARCH.hrp2-builder=\
	include/robotbuilder/robotbuilder.hh \
	lib/pkgconfig/robotbuilder.pc

DEPEND_USE+=			hrp2-builder

DEPEND_ABI.hrp2-builder?=	hrp2-builder>=1.2
DEPEND_DIR.hrp2-builder?=	../../robots/hrp2-builder

endif # HRP2_BUILDER_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
