# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENCV_DEPEND_MK:=	${OPENCV_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		opencv
endif

ifeq (+,$(OPENCV_DEPEND_MK))
PREFER.opencv?=		robotpkg

DEPEND_USE+=		opencv

DEPEND_ABI.opencv?=	opencv>=1.0.0
DEPEND_DIR.opencv?=	../../image/opencv

DEPEND_PKG_CONFIG.opencv+=lib/pkgconfig

SYSTEM_SEARCH.opencv=\
	include/opencv/cv.h		\
	lib/pkgconfig/opencv.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
