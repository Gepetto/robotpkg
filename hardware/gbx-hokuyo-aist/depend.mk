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
#                                            Anthony Mallet on Wed Mar 17 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GBX_HOKUYO_AIST_DEPEND_MK:=${GBX_HOKUYO_AIST_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gbx-hokuyo-aist
endif

ifeq (+,$(GBX_HOKUYO_AIST_DEPEND_MK)) # ------------------------------------

PREFER.gearbox?=	robotpkg
PREFER.gbx-hokuyo-aist?=${PREFER.gearbox}

SYSTEM_SEARCH.gbx-hokuyo_aist=\
	'include/gearbox/hokuyo_aist/hokuyo_aist.h'			\
	'lib/pkgconfig/hokuyo_aist.pc:/Version/s/[^.0-9]//gp'		\
	'lib/gearbox/libhokuyo_aist.*'

DEPEND_USE+=		gbx-hokuyo-aist

DEPEND_ABI.gbx-hokuyo-aist?=	gbx-hokuyo-aist>=1.0.0
DEPEND_DIR.gbx-hokuyo-aist?=	../../hardware/gbx-hokuyo-aist

endif # GBX_HOKUYO_AIST_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
