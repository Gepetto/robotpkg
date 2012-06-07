# robotpkg depend.mk for:	image/opencv
# Created:			Anthony Mallet on Fri, 14 Mar 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENCV_DEPEND_MK:=	${OPENCV_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		opencv
endif

ifeq (+,$(OPENCV_DEPEND_MK)) # ---------------------------------------------

PREFER.opencv?=		robotpkg

DEPEND_USE+=		opencv
DEPEND_ABI.opencv?=	opencv>=2.2.0
DEPEND_DIR.opencv?=	../../image/opencv

SYSTEM_SEARCH.opencv=\
	include/opencv/cv.h		\
	'lib/pkgconfig/opencv.pc:/Version/s/[^.0-9]//gp'

endif # OPENCV_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
