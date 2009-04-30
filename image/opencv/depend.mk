# $LAAS: depend.mk 2009/04/30 16:07:53 mallet $
#
# Copyright (c) 2008-2009 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice  and this list of  conditions in the documentation   and/or
#      other materials provided with the distribution.
#
#                                       Anthony Mallet on Fri May 14 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENCV_DEPEND_MK:=	${OPENCV_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		opencv
endif

ifeq (+,$(OPENCV_DEPEND_MK)) # ---------------------------------------------

PREFER.opencv?=		robotpkg

DEPEND_USE+=		opencv

DEPEND_ABI.opencv?=	opencv>=1.1pre1
DEPEND_DIR.opencv?=	../../image/opencv

SYSTEM_SEARCH.opencv=\
	include/opencv/cv.h		\
	'lib/pkgconfig/opencv.pc:/Version/s/[^.0-9]//gp'

endif # OPENCV_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
