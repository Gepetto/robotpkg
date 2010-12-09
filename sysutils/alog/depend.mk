# robotpkg depend.mk for:	sysutils/alog
# Created:			Matthieu Herrb on Thu,  9 Dec 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ALOG_DEPEND_MK:=	${ALOG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		alog
endif

ifeq (+,$(ALOG_DEPEND_MK)) # --------------------------------------------

PREFER.alog?=	robotpkg

DEPEND_USE+=		alog

DEPEND_ABI.alog?=	alog>=0.4
DEPEND_DIR.alog?=	../../sysutils/alog

SYSTEM_SEARCH.alog=	bin/alog \
			bin/alogview

endif # ALOG_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
