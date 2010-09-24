# robotpkg depend.mk for:	knowledge/liboro
# Created:			Anthony Mallet on Mon, 15 Jun 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBORO_DEPEND_MK:=	${LIBORO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		liboro
endif

ifeq (+,$(LIBORO_DEPEND_MK)) # ---------------------------------------------

PREFER.liboro?=		robotpkg

SYSTEM_SEARCH.liboro=\
	include/liboro/oro.h	\
	lib/liboro.so

DEPEND_USE+=		liboro

DEPEND_ABI.liboro?=	liboro>=0.7.9
DEPEND_DIR.liboro?=	../../knowledge/liboro

endif # LIBORO_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
