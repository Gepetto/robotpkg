#
# Copyright (c) 2018,2020 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use  in  source  and binary  forms,  with  or  without
# modification, are permitted provided that the following conditions are met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
# THE SOFTWARE  IS PROVIDED "AS IS"  AND THE AUTHOR  DISCLAIMS ALL WARRANTIES
# WITH  REGARD   TO  THIS  SOFTWARE  INCLUDING  ALL   IMPLIED  WARRANTIES  OF
# MERCHANTABILITY AND  FITNESS.  IN NO EVENT  SHALL THE AUTHOR  BE LIABLE FOR
# ANY  SPECIAL, DIRECT,  INDIRECT, OR  CONSEQUENTIAL DAMAGES  OR  ANY DAMAGES
# WHATSOEVER  RESULTING FROM  LOSS OF  USE, DATA  OR PROFITS,  WHETHER  IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR  OTHER TORTIOUS ACTION, ARISING OUT OF OR
# IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
#                                           Anthony Mallet on Wed Sep 12 2018
#

#
# OpenCV alternative
#
# This file determines which OpenCV version is used as a dependency for
# a package.
#
# === User-settable variables ===
#
# PREFER_ALTERNATIVE.opencv
#	The preferred OpenCV version to use. The order of the entries matters,
#	since earlier entries are preferred over later ones.
#
#	Possible values: opencv2 opencv3
#	Default: opencv3 opencv2
#
# === Package-settable variables ===
#
# DEPEND_ABI.opencv
#	The OpenCV versions that are acceptable for the package.
#
#	Possible values: any pattern
#	Default: opencv>=2.2.0
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENCV_DEPEND_MK:=	${OPENCV_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=		${PKG_ALTERNATIVE.opencv}
endif

ifeq (+,$(OPENCV_DEPEND_MK)) # ---------------------------------------------

DEPEND_USE+=		${PKG_ALTERNATIVE.opencv}

# define an alternative for available opencvs packages
PKG_ALTERNATIVES+=	opencv
PKG_ALTERNATIVES.opencv=opencv2 opencv3

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Debian,${OPSYS})
  ifneq (,$(filter 8,${OS_VERSION}))
    PREFER_ALTERNATIVE.opencv?=	opencv2 opencv3
  endif
else ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 12.04 14.04 16.04,${OS_VERSION}))
    PREFER_ALTERNATIVE.opencv?=	opencv2 opencv3
  endif
else ifeq (CentOS,${OPSYS})
  PREFER_ALTERNATIVE.opencv?=	opencv2 opencv3
else ifeq (Gentoo,${OS_FAMILY})
  PREFER_ALTERNATIVE.opencv?=	opencv2 opencv3
endif
PREFER_ALTERNATIVE.opencv?=	opencv3 opencv2

DEPEND_ABI.opencv?=	opencv>=2.2.0

PKG_ALTERNATIVE_DESCR.opencv2= Use opencv-2
define PKG_ALTERNATIVE_SELECT.opencv2
  $(call preduce,${DEPEND_ABI.opencv} opencv>=2<3)
endef
define PKG_ALTERNATIVE_SET.opencv2
  _opencv_abi:=$(subst opencv,opencv2,${PKG_ALTERNATIVE_SELECT.opencv2})
  DEPEND_ABI.opencv2?=	$(strip ${_opencv_abi})

  include ../../image/opencv2/depend.mk
endef

PKG_ALTERNATIVE_DESCR.opencv3= Use opencv-3
define PKG_ALTERNATIVE_SELECT.opencv3
  $(call preduce,${DEPEND_ABI.opencv} opencv>=3<4)
endef
define PKG_ALTERNATIVE_SET.opencv3
  _opencv_abi:=$(subst opencv,opencv3,${PKG_ALTERNATIVE_SELECT.opencv3})
  DEPEND_ABI.opencv3?=	$(strip ${_opencv_abi})

  include ../../image/opencv3/depend.mk
endef

endif # OPENCV_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
