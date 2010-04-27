#
# Copyright (c) 2010 LAAS/CNRS
# All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without   fee is hereby granted, provided   that the above  copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
#
#                                       Nizar Khalifa Sallem on Tue Apr 27 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENCV_DEPEND_MK:=	${OPENCV_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		opencv
endif

ifeq (+,$(OPENCV_DEPEND_MK)) # ---------------------------------------------

PREFER.opencv?=		robotpkg

DEPEND_USE+=		opencv
DEPEND_ABI.opencv?=	opencv>=2.1.0
DEPEND_DIR.opencv?=	../../image/opencv

SYSTEM_SEARCH.opencv=\
	include/opencv/cv.h		\
	'lib/pkgconfig/opencv.pc:/Version/s/[^.0-9]//gp'

endif # OPENCV_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
