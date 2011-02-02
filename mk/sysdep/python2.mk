#
# Copyright (c) 2009-2011 LAAS/CNRS
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
#                                             Anthony Mallet on Thu Jun 11 2009
#

#
# This Makefile fragment defines additional variables that are used
# by packages that need python.
#
# Optional variables that may be defined by the package are:
#
#	PYTHON_REQUIRED is the version of python required, e.g. ">=2.4".
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON2_DEPEND_MK:=	${PYTHON2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python2
endif

ifeq (+,$(PYTHON2_DEPEND_MK)) # --------------------------------------------

PREFER.python2?=	system

DEPEND_USE+=		python2
DEPEND_ABI.python2?=	python2${_PY2_REQUIRED}
_PY2_REQUIRED?=		>=2.4<3

_py2namespec=python{2.7,2.6,2.5,2.4,[0-9].[0-9],}
SYSTEM_SEARCH.python2=\
	'bin/${_py2namespec}:s/[^.0-9]//gp:% --version' 	\
	'include/${_py2namespec}/patchlevel.h:/PY_VERSION/s/[^.0-9]//gp'	\
	'lib/lib${_py2namespec}.{so,dylib,a}:s/^.*python//;s/[^.0-9]//gp:${ECHO} %'

SYSTEM_PKG.Linux-fedora.python2=python-devel
SYSTEM_PKG.NetBSD.python2=	pkgsrc/lang/python

export PYTHON2=		$(firstword ${SYSTEM_FILES.python2})
export PYTHON2_INCLUDE=	$(dir $(word 2,${SYSTEM_FILES.python2}))
export PYTHON2_LIB=	$(word 3,${SYSTEM_FILES.python2})

endif # PYTHON2_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
