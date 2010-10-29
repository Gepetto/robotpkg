# robotpkg depend.mk for:	graphics/laaswm-libs
# Created:			Xavier Broquere on Fri, 29 Oct 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LAASWM-LIBS_DEPEND_MK:=		${LAASWM-LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		laaswm-libs
endif

ifeq (+,$(LAASWM-LIBS_DEPEND_MK)) # ------------------------------------------------

PREFER.laaswm-libs?=		robotpkg

SYSTEM_SEARCH.laaswm-libs=\
	include/wmclient.h	\
	lib/libwmclient.la	\
	share/wmclient/wmclient.tcl

DEPEND_USE+=		laaswm-libs

DEPEND_ABI.laaswm-libs?=	laaswm-libs>=1.0
DEPEND_DIR.laaswm-libs?=	../../graphics/laaswm-libs

endif # LAASWM-LIBS_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
