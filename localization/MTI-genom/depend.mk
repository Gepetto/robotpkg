# robotpkg depend.mk for:	localization/MTI-genom
# Created:			Arnaud Degroote on Thu, 17 Jul 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MTIGENOM_DEPEND_MK:=	${MTIGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		MTI-genom
endif

ifeq (+,$(MTIGENOM_DEPEND_MK))
PREFER.MTI-genom?=	robotpkg

DEPEND_USE+=		MTI-genom

DEPEND_ABI.MTI-genom?=	MTI-genom>=0.4
DEPEND_DIR.MTI-genom?=	../../localization/MTI-genom

SYSTEM_SEARCH.MTI-genom=\
	lib/pkgconfig/MTI.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
