# robotpkg depend.mk for:	image/opencv3
# Created:			Anthony Mallet on Wed, 12 Sep 2018
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENCV3_DEPEND_MK:=	${OPENCV3_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		opencv3
endif

ifeq (+,$(OPENCV3_DEPEND_MK)) # --------------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 12.04 14.04 16.04%,${OS_VERSION}))
    PREFER.opencv3?=	robotpkg
  endif
else ifeq (Debian,${OPSYS})
  ifneq (,$(filter 8,${OS_VERSION}))
    PREFER.opencv3?=	robotpkg
  endif
else ifeq (CentOS,${OPSYS})
  PREFER.opencv3?=	robotpkg
else ifeq (Arch,${OPSYS})
  PREFER.opencv3?=	robotpkg
endif
PREFER.opencv3?=	system

DEPEND_USE+=		opencv3
DEPEND_ABI.opencv3?=	opencv3>=3
DEPEND_DIR.opencv3?=	../../image/opencv3

SYSTEM_SEARCH.opencv3=\
  'include{,/opencv-*}/opencv/cv.h'					\
  'include{,/opencv-*}/opencv/highgui.h'				\
  'include{,/opencv-*}/opencv2/core/version.hpp'			\
  'include{,/opencv-*}/opencv2/highgui/highgui.hpp'			\
  'lib/pkgconfig/opencv{,-[0-9]*}.pc:/Version/s/[^.0-9]//gp'		\
  '{lib/cmake,share,lib}/{OpenCV,opencv}/OpenCVConfig.cmake'

SYSTEM_PKG.Debian.opencv3=	libopencv-dev libcv-dev libhighgui-dev
SYSTEM_PKG.Fedora.opencv3=	opencv-devel
SYSTEM_PKG.Gentoo.opencv3=	media-libs/opencv
SYSTEM_PKG.NetBSD.opencv3=	graphics/opencv

endif # OPENCV3_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
