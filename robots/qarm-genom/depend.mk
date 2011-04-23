# robotpkg depend.mk for:	robots/qarm-genom
# Created:			Xavier Broquere on Thu, 19 Mar 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
QARMGENOM_DEPEND_MK:=	${QARMGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qarm-genom
endif

ifeq (+,$(QARMGENOM_DEPEND_MK))# -------------------------------------
PREFER.qarm-genom?=	robotpkg

DEPEND_USE+=		qarm-genom

DEPEND_ABI.qarm-genom?=	qarm-genom>=1.1
DEPEND_DIR.qarm-genom?=	../../robots/qarm-genom

SYSTEM_SEARCH.qarm-genom=\
	include/qarm/qarmStruct.h		\
	lib/pkgconfig/qarm.pc


include ../../architecture/genom/depend.mk

endif # QARMGENOM_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
