# robotpkg depend.mk for:	hardware/sick-genom
# Created:			Anthony Mallet on Tue, 17 Jun 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SICKGENOM_DEPEND_MK:=	${SICKGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sick-genom
endif

ifeq (+,$(SICKGENOM_DEPEND_MK))
PREFER.sick-genom?=	robotpkg

DEPEND_USE+=		sick-genom

DEPEND_ABI.sick-genom?=	sick-genom>=0.1
DEPEND_DIR.sick-genom?=	../../hardware/sick-genom

SYSTEM_SEARCH.sick-genom=\
	include/sick/sickStruct.h		\
	lib/pkgconfig/sick.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
