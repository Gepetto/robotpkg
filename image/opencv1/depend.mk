# robotpkg depend.mk for:	image/opencv1
# Created:			Anthony Mallet on Tue, 27 Apr 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENCV1_DEPEND_MK:=	${OPENCV1_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		opencv1
endif

ifeq (+,$(OPENCV1_DEPEND_MK)) # --------------------------------------------

PREFER.opencv1?=		robotpkg

DEPEND_USE+=		opencv1

DEPEND_ABI.opencv1?=	opencv1>=1.1pre1
DEPEND_DIR.opencv1?=	../../image/opencv1

SYSTEM_SEARCH.opencv1=\
	include/opencv/cv.h		\
	'lib/pkgconfig/opencv.pc:/Version/s/[^.0-9]//gp'

endif # OPENCV1_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
