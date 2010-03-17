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
GBX_FLEXIPORT_DEPEND_MK:=${GBX_FLEXIPORT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gbx-flexiport
endif

ifeq (+,$(GBX_FLEXIPORT_DEPEND_MK)) # --------------------------------------

PREFER.gearbox?=	robotpkg
PREFER.gbx-flexiport?=	${PREFER.gearbox}

SYSTEM_SEARCH.gbx-flexiport=\
	'include/gearbox/flexiport/flexiport.h'			\
	'lib/pkgconfig/flexiport.pc:/Version/s/[^.0-9]//gp'	\
	'lib/gearbox/libflexiport.*'

DEPEND_USE+=		gbx-flexiport

DEPEND_ABI.gbx-flexiport?=	gbx-flexiport>=1.0.0
DEPEND_DIR.gbx-flexiport?=	../../devel/gbx-flexiport

endif # GBX_FLEXIPORT_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
