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
  'include/opencv/cv.h'					\
  'include/opencv/highgui.h'				\
  'include/opencv2/core/version.hpp'			\
  'include/opencv2/highgui/highgui.hpp'			\
  'lib/pkgconfig/opencv.pc:/Version/s/[^.0-9]//gp'

SYSTEM_PKG.Debian=	libopencv-dev libcv-dev libhighgui-dev
SYSTEM_PKG.Fedora=	opencv-devel
SYSTEM_PKG.Gentoo=	media-libs/opencv
SYSTEM_PKG.NetBSD=	graphics/opencv

endif # OPENCV_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
