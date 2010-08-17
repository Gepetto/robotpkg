# robotpkg depend.mk for:	manipulation/xarm-genom
# Created:			Anthony Mallet on Tue, 28 Jul 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
XARMGENOM_DEPEND_MK:=	${XARMGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		xarm-genom
endif

ifeq (+,$(XARMGENOM_DEPEND_MK))# -------------------------------------
PREFER.xarm-genom?=	robotpkg

DEPEND_USE+=		xarm-genom

DEPEND_ABI.xarm-genom?=	xarm-genom>=1.0
DEPEND_DIR.xarm-genom?=	../../robots/xarm-genom

SYSTEM_SEARCH.xarm-genom=\
	include/xarm/xarmStruct.h		\
	lib/pkgconfig/xarm.pc

endif # XARMGENOM_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
