# robotpkg depend.mk for:	image/opencv4
# Created:			Guilhem Saurel on Tue,  8 Dec 2020
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENCV4_DEPEND_MK:=	${OPENCV4_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		opencv4
endif

ifeq (+,$(OPENCV4_DEPEND_MK)) # --------------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 12.04 14.04 16.04 18.04%,${OS_VERSION}))
    PREFER.opencv4?=	robotpkg
  endif
else ifeq (Debian,${OPSYS})
  ifneq (,$(filter 8,${OS_VERSION}))
    PREFER.opencv4?=	robotpkg
  endif
else ifeq (CentOS,${OPSYS})
  PREFER.opencv4?=	robotpkg
endif
PREFER.opencv4?=	system

DEPEND_USE+=		opencv4
DEPEND_ABI.opencv4?=	opencv4>=4<5
DEPEND_DIR.opencv4?=	../../image/opencv4

SYSTEM_SEARCH.opencv4=\
  'include{,/opencv*}/opencv2/core/version.hpp'		\
  'include{,/opencv*}/opencv2/highgui/highgui.hpp'	\
  'lib/pkgconfig/opencv4.pc:/Version/s/[^.0-9]//gp'	\
  '{lib/cmake,share,lib}/opencv4/OpenCVConfig.cmake'

SYSTEM_PKG.Debian.opencv4=	libopencv-dev libopencv-highgui-dev
SYSTEM_PKG.NetBSD.opencv4=	graphics/opencv

endif # OPENCV4_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
