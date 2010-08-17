# robotpkg depend.mk for:	devel/cortex-sdk
# Created:			Anthony Mallet on Tue, 27 Jan 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
CORTEX_SDK_DEPEND_MK:=	${CORTEX_SDK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		cortex-sdk
endif

ifeq (+,$(CORTEX_SDK_DEPEND_MK)) # -----------------------------------------
PREFER.cortex-sdk?=	robotpkg

DEPEND_USE+=		cortex-sdk

DEPEND_ABI.cortex-sdk?=	cortex-sdk>=1.0.3
DEPEND_DIR.cortex-sdk?=	../../devel/cortex-sdk

SYSTEM_SEARCH.cortex-sdk=\
	bin/EVaComm2.dll		\
	include/EVaRT2.h

endif # CORTEX_SDK_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
