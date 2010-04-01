#
# Copyright (c) 2009-2010 LAAS/CNRS
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

ifndef LANGUAGE_PYTHON_MK # ================================================

# If we are included directly, simply register the language requirements
USE_LANGUAGES+=		python
PYTHON_REQUIRED+=	<=2.99

else # =====================================================================

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON_DEPEND_MK:=	${PYTHON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python
endif

ifeq (+,$(PYTHON_DEPEND_MK)) # ---------------------------------------------

PREFER.python?=		system

DEPEND_USE+=		python
DEPEND_ABI.python?=	python${_PYTHON_REQUIRED}

_pynamespec=python{2.6,2.5,2.4,[0-9].[0-9],}
SYSTEM_SEARCH.python=\
	'bin/${_pynamespec}:s/[^.0-9]//gp:% --version' 	\
	'include/${_pynamespec}/patchlevel.h:/PY_VERSION/s/[^.0-9]//gp'

SYSTEM_PKG.Linux-fedora.python=	python-devel
SYSTEM_PKG.NetBSD.python=	pkgsrc/lang/python

export PYTHON=		$(firstword ${SYSTEM_FILES.python})


endif # PYTHON_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

endif # LANGUAGE_PYTHON_MK =================================================
