# $LAAS: depend.mk 2009/01/27 17:19:38 mallet $
#
# Copyright (c) 2009 LAAS/CNRS
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
#                                             Anthony Mallet on Thu Jan 22 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
YARP_DEPEND_MK:=	${YARP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		yarp
endif

ifeq (+,$(YARP_DEPEND_MK)) # -----------------------------------------------

PREFER.yarp?=		robotpkg

DEPEND_USE+=		yarp
DEPEND_ABI.yarp?=	yarp>=2.2.2

SYSTEM_SEARCH.yarp=\
	'bin/yarp:s/[^.0-9]//gp:% version'	\
	include/yarp/dev/all.h			\
	lib/libYARP_OS.{a,so}

USE_YARP=		yes
export YARP=		${PREFIX.yarp}/bin/yarp

endif # YARP_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
