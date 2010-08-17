# robotpkg depend.mk for:	image/sift
# Created:			nksallem on Wed, 9 Jun 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SIFT_DEPEND_MK:=	${SIFT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sift
endif

ifeq (+,$(SIFT_DEPEND_MK)) # -----------------------------------------------

PREFER.sift?=		robotpkg

DEPEND_USE+=		sift
DEPEND_ABI.sift?=	sift>=1.1.2
DEPEND_DIR.sift?=	../../image/sift

SYSTEM_SEARCH.sift=\
	include/sift/sift.h	\
	lib/libsift.la

endif # SIFT_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
