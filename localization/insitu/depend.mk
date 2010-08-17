# robotpkg depend.mk for:	localization/insitu
# Created:			Anthony Mallet on Mon, 19 May 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
INSITU_DEPEND_MK:=	${INSITU_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		insitu
endif

ifeq (+,$(INSITU_DEPEND_MK)) # ---------------------------------------

PREFER.insitu?=		robotpkg

DEPEND_USE+=		insitu

DEPEND_ABI.insitu?=	insitu>=1.3
DEPEND_DIR.insitu?=	../../localization/insitu

SYSTEM_SEARCH.insitu=\
	include/insitu/lib.h	\
	lib/pkgconfig/insitu.pc

endif # --------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
