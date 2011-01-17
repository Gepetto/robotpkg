# robotpkg depend.mk for:	supervision/openprs
# Created:			Anthony Mallet on Thu, 12 Mar 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENPRS_DEPEND_MK:=	${OPENPRS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openprs
endif

ifeq (+,$(OPENPRS_DEPEND_MK)) # --------------------------------------------

PREFER.openprs?=	robotpkg

DEPEND_USE+=		openprs

DEPEND_ABI.openprs?=	openprs>=1.0b1
DEPEND_DIR.openprs?=	../../supervision/openprs

SYSTEM_SEARCH.openprs=\
	bin/oprs			\
	include/openprs/oprs_f-pub.h	\
	lib/pkgconfig/openprs.pc	\
	lib/libMP.a

endif # OPENPRS_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
