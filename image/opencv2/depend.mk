# robotpkg depend.mk for:	image/opencv2
# Created:			Anthony Mallet on Fri, 14 Mar 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENCV2_DEPEND_MK:=	${OPENCV2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		opencv2
endif

ifeq (+,$(OPENCV2_DEPEND_MK)) # --------------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 12.04 14.04 16.04,${OS_VERSION}))
    PREFER.opencv2?=	system
  endif
  PREFER.opencv2?=	robotpkg
else ifeq (Debian,${OPSYS})
  ifneq (,$(filter 8,${OS_VERSION}))
    PREFER.opencv2?=	system
  endif
  PREFER.opencv2?=	robotpkg
else ifeq (Fedora,${OPSYS})
  PREFER.opencv2?=	robotpkg
else ifeq (NetBSD,${OPSYS})
  PREFER.opencv2?=	robotpkg
endif
PREFER.opencv2?=	system

DEPEND_USE+=		opencv2
DEPEND_ABI.opencv2?=	opencv2>=2.2.0<3
DEPEND_DIR.opencv2?=	../../image/opencv2

SYSTEM_SEARCH.opencv2=\
  'include{,/opencv-*}/opencv/cv.h'					\
  'include{,/opencv-*}/opencv/highgui.h'				\
  'include{,/opencv-*}/opencv2/core/version.hpp'			\
  'include{,/opencv-*}/opencv2/highgui/highgui.hpp'			\
  'lib/pkgconfig/opencv{,-[0-9]*}.pc:/Version/s/[^.0-9]//gp'		\
  '{lib/cmake,share,lib}/{OpenCV,opencv}/OpenCVConfig.cmake'

SYSTEM_PKG.Debian.opencv2=	libopencv-dev libcv-dev libhighgui-dev
SYSTEM_PKG.Fedora.opencv2=	opencv-devel
SYSTEM_PKG.Gentoo.opencv2=	media-libs/opencv
SYSTEM_PKG.NetBSD.opencv2=	graphics/opencv

endif # OPENCV2_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
