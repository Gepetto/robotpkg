# $Id: depend.mk 2008/05/19 16:42:15 mallet $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
INSITU_DEPEND_MK:=	${INSITU_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		insitu
endif

ifeq (+,$(INSITU_DEPEND_MK)) # ---------------------------------------

PREFER.insitu?=		robotpkg

DEPEND_USE+=		insitu

DEPEND_ABI.insitu?=	insitu>=1.2
DEPEND_DIR.insitu?=	../../localization/insitu

DEPEND_PKG_CONFIG.insitu+=lib/pkgconfig

SYSTEM_SEARCH.insitu=\
	include/insitu/lib.h	\
	lib/pkgconfig/insitu.pc

endif # --------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
