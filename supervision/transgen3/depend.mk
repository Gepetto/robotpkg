# robotpkg depend.mk for:	supervision/transgen3
# Created:			Anthony Mallet on Mon,  9 Nov 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TRANSGEN3_DEPEND_MK:=	${TRANSGEN3_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		transgen3
endif

ifeq (+,$(TRANSGEN3_DEPEND_MK)) # -------------------------------------------

PREFER.transgen3?=	robotpkg

DEPEND_USE+=		transgen3

DEPEND_ABI.transgen3?=	transgen3>=1.0b2
DEPEND_DIR.transgen3?=	../../supervision/transgen3

SYSTEM_SEARCH.transgen3=\
	bin/transgen3			\
	include/transgen3/genom-oprs.h	\
	lib/pkgconfig/transgen3.pc	\
	lib/genom-oprs.la

endif # TRANSGEN3_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
