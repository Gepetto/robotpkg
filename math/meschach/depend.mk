# robotpkg depend.mk for:	math/meschach
# Created:			Anthony Mallet on Thu, 16 Dec 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MESCHACH_DEPEND_MK:=	${MESCHACH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		meschach
endif

ifeq (+,$(MESCHACH_DEPEND_MK)) # -------------------------------------------

PREFER.meschach?=	robotpkg

DEPEND_USE+=		meschach

SYSTEM_SEARCH.meschach=\
	include/meschach/matrix.h	\
	lib/libmeschach.a

DEPEND_ABI.meschach?=	meschach
DEPEND_DIR.meschach?=	../../math/meschach

endif # MESCHACH_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
