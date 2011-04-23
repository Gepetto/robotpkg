# robotpkg depend.mk for:	localization/pom-genom
# Created:			Anthony Mallet on Fri, 14 Mar 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
POMGENOM_DEPEND_MK:=	${POMGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pom-genom
endif

ifeq (+,$(POMGENOM_DEPEND_MK))
PREFER.pom-genom?=	robotpkg

DEPEND_USE+=		pom-genom

DEPEND_ABI.pom-genom?=	pom-genom>=0.5r1
DEPEND_DIR.pom-genom?=	../../localization/pom-genom

SYSTEM_SEARCH.pom-genom=\
	include/pom/pomStruct.h		\
	lib/pkgconfig/pom.pc

include ../../architecture/genom/depend.mk

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
