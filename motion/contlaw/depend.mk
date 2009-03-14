#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
CONTLAW_DEPEND_MK:=	${CONTLAW_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		contlaw
endif

ifeq (+,$(CONTLAW_DEPEND_MK))
PREFER.contlaw?=	robotpkg

DEPEND_USE+=		contlaw

DEPEND_ABI.contlaw?=	contlaw>=1.0
DEPEND_DIR.contlaw?=	../../motion/contlaw

SYSTEM_SEARCH.contlaw= \
	include/contlaw/contLaw.h \
	lib/libcontlaw.la \
	lib/pkgconfig/contlaw.pc

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
