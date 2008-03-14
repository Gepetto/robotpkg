# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
POMGENOM_DEPEND_MK:=	${POMGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pom-genom
endif

ifeq (+,$(POMGENOM_DEPEND_MK))
PREFER.pom-genom?=	robotpkg

DEPEND_USE+=		pom-genom

DEPEND_ABI.pom-genom?=	pom-genom>=0.99
DEPEND_DIR.pom-genom?=	../../localization/pom-genom

DEPEND_PKG_CONFIG.pom-genom+=lib/pkgconfig

SYSTEM_SEARCH.pom-genom=\
	include/pom/pomStruct.h		\
	lib/pkgconfig/pom.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
