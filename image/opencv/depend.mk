# robotpkg depend.mk for:	image/opencv
# Created:			Anthony Mallet on Fri, 14 Mar 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENCV_DEPEND_MK:=	${OPENCV_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		opencv
endif

ifeq (+,$(OPENCV_DEPEND_MK)) # ---------------------------------------------

PREFER.opencv?=		system

DEPEND_USE+=		opencv
DEPEND_ABI.opencv?=	opencv>=2.2.0
DEPEND_DIR.opencv?=	../../image/opencv

SYSTEM_SEARCH.opencv=\
  'include{,/opencv-*}/opencv/cv.h'					\
  'include{,/opencv-*}/opencv/highgui.h'				\
  'include{,/opencv-*}/opencv2/core/version.hpp'			\
  'include{,/opencv-*}/opencv2/highgui/highgui.hpp'			\
  'lib/pkgconfig/opencv{,-[0-9]*}.pc:/Version/s/[^.0-9]//gp'		\
  '{lib/cmake,share}/{OpenCV,opencv}/OpenCVConfig.cmake'

SYSTEM_PKG.Debian.opencv=	libopencv-dev libcv-dev libhighgui-dev
SYSTEM_PKG.Fedora.opencv=	opencv-devel
SYSTEM_PKG.Gentoo.opencv=	media-libs/opencv
SYSTEM_PKG.NetBSD.opencv=	graphics/opencv

endif # OPENCV_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
