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
#                                             Thomas Moulard on Mon May 17 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PLOTUTILS_DEPEND_MK:=	${PLOTUTILS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		plotutils
endif

ifeq (+,$(PLOTUTILS_DEPEND_MK)) # ---------------------------------------------

PREFER.plotutils?=		system

DEPEND_USE+=		plotutils

DEPEND_ABI.plotutils?=	plotutils>=4.2

SYSTEM_SEARCH.plotutils=	\
	'include/plotter.h:/PL_LIBPLOT_VER_STRING .*"/s/[^.0-9]//gp'	\
	'lib/libplot.{a,so,dylib}'

SYSTEM_PKG.Linux-fedora.plotutils=	plotutils-devel

# FIXME: check package names.
# SYSTEM_PKG.Linux-ubuntu.plotutils=	plotutils-dev
# SYSTEM_PKG.Linux-debian.plotutils=	plotutils-dev

endif # PLOTUTILS_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
