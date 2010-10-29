# robotpkg depend.mk for:	graphics/laaswm
# Created:			Xavier Broquere on Fri, 29 Oct 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LAASWM_DEPEND_MK:=		${LAASWM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		laaswm
endif

ifeq (+,$(LAASWM_DEPEND_MK)) # ------------------------------------------------

PREFER.laaswm?=		robotpkg

SYSTEM_SEARCH.laaswm=\
	bin/laaswm

DEPEND_USE+=		laaswm

DEPEND_ABI.laaswm?=	laaswm>=1.0
DEPEND_DIR.laaswm?=	../../graphics/laaswm

endif # LAASWM_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
