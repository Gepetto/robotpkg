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
#                                             Anthony Mallet on Thu Jun 11 2009
#

#
# This Makefile fragment defines additional variables that are used
# by packages that need python.
#
# Optional variables that may be defined by the package are:
#
#	PYTHON_REQD is the version of python required, e.g. "2.4".
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON_DEPEND_MK:=	${PYTHON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python
endif

ifeq (+,$(PYTHON_DEPEND_MK)) # ---------------------------------------------

PREFER.python?=		system

PYTHON_REQD?=		2.4

DEPEND_USE+=		python
DEPEND_ABI.python?=	python>=${PYTHON_REQD}

SYSTEM_SEARCH.python=\
	'bin/python{[0-9].[0-9],${PYTHON_REQD},}:s/[^.0-9]//gp:% --version'

export PYTHON=		$(firstword ${SYSTEM_FILES.python})

_PYTHON_VERSION=$(word 1,$(shell ${PYTHON} -c "import sys; print sys.version"))
_PYTHON_PREFIX=	$(shell ${PYTHON} -c "import sys; print sys.prefix")
PYTHON_SITELIB=	$(shell ${PYTHON} -c \
 "from distutils import sysconfig; print sysconfig.get_python_lib(0,0,prefix='')")

# Add extra replacement in PLISTs
PLIST_SUBST+=\
	PLIST_PYTHON_SITELIB=$(call quote,${PYTHON_SITELIB})
PRINT_PLIST_AWK_SUBST+=\
	gsub("${PYTHON_SITELIB}/", "$${PYTHON_SITELIB}/");

endif # PYTHON_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
