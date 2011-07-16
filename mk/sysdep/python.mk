#
# Copyright (c) 2010-2011 LAAS/CNRS
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
#                                           Anthony Mallet on Thu Apr  1 2010
#

#
# Python language definitions
#
# This file determines which Python version is used as a dependency for
# a package.
#
# === User-settable variables ===
#
# PKG_SELECT.python
#	The preferred Python interpreters/versions to use. The
#	order of the entries matters, since earlier entries are
#	preferred over later ones.
#
#	Possible values: python25 python26 python27 python30 python31 python32
#	Default: python26 python27 python31 python32
#
# === Package-settable variables ===
#
# DEPEND_ABI.python
#	The Python versions that are acceptable for the package.
#
#	Possible values: any pattern
#	Default: python>=2.5 python<3
#
# === Defined variables ===
#
# PYPKGPREFIX
#       The prefix to use in PKGNAME for extensions which are meant
#       to be installed for multiple Python versions.
#
#       Example: py26
#
# PYTHON_VERSION
#	The suffix to executables and in the library path, equal to
#	sys.version[0:3].
#
#	Example: 2.6
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON_DEPEND_MK:=	${PYTHON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=		${ALTERNATIVE.python}
endif

ifeq (+,$(PYTHON_DEPEND_MK)) # ---------------------------------------------

DEPEND_USE+=		${ALTERNATIVE.python}
DEPEND_ALTERNATIVE+=	python

PREFER.python?=		system
DEPEND_ABI.python?=	python>=2.5<3.3

# factorize SYSTEM_SEARCH.python* here for all python* packages
override define _py_syssearch
  'bin/python$1:s/[^.0-9]//gp:% --version'				\
  'lib/libpython$1.{so,a}:s@^.*/@@;s/[^.0-9]//g;s/[.]$$//;p:${ECHO} %'	\
  'include/python$1/patchlevel.h:/PY_VERSION/s/[^.0-9]//gp'
endef

# define an alternative for available pythons packages
ALTERNATIVES.python=	python25 python26 python27 python31 python32
PKG_SELECT.python?=	python26 python27 python31 python32

ALTERNATIVE_ABI.python25=	python>=2.5<2.6
ALTERNATIVE_ABI.python26=	python>=2.6<2.7
ALTERNATIVE_ABI.python27=	python>=2.7<2.8
ALTERNATIVE_ABI.python31=	python>=3.1<3.2
ALTERNATIVE_ABI.python32=	python>=3.2<3.3

ALTERNATIVE_MK.python25?=	../../mk/sysdep/python25.mk
ALTERNATIVE_MK.python26?=	../../mk/sysdep/python26.mk
ALTERNATIVE_MK.python27?=	../../mk/sysdep/python27.mk
ALTERNATIVE_MK.python31?=	../../lang/python31/depend.mk
ALTERNATIVE_MK.python32?=	../../mk/sysdep/python32.mk

# define some variables for use in the packages
export PYTHON=		$(firstword ${SYSTEM_FILES.${ALTERNATIVE.python}})
export PYTHON_LIB=	$(word 2,${SYSTEM_FILES.${ALTERNATIVE.python}})
export PYTHON_INCLUDE=	$(dir $(word 3,${SYSTEM_FILES.${ALTERNATIVE.python}}))

PYPKGPREFIX=\
  $(word 1,$(patsubst python%,py%,$(filter py%,${ALTERNATIVE.python}) py))
PYTHON_VERSION=$(patsubst py2%,2.%,$(patsubst py3%,3.%,${PYPKGPREFIX}))
PYTHON_SITELIB=lib/python${PYTHON_VERSION}/site-packages
PYTHON_SYSLIBSEARCH=lib/python${PYTHON_VERSION}/{site,dist}-packages

BUILD_DEFS+=	PYTHON_VERSION

# require preferences for PYTHON definition and immediate expansions below
include ../../mk/robotpkg.prefs.mk

PYTHON_SYSLIB:=$(if ${PYTHON},$(shell ${PYTHON} 2>/dev/null -c		\
	'import distutils.sysconfig;                                    \
	print(distutils.sysconfig.get_python_lib(0, 0, ""))'))

# PYTHONPATH.<pkg> is a list of subdirectories of PREFIX.<pkg> (or absolute
# directories) that should be added to the python search paths.
#
_PYTHON_SYSPATH:=$(if ${PYTHON},					\
  $(shell ${SETENV} PYTHONPATH= ${PYTHON} 2>/dev/null -c		\
	'import sys; print(" ".join(sys.path))'))

PYTHONPATH=$(call prependpaths, $(filter-out ${_PYTHON_SYSPATH},	\
	$(patsubst %/,%,$(foreach _pkg_,${DEPEND_USE},			\
	  $(addprefix							\
	    ${PREFIX.${_pkg_}}/, $(patsubst ${PREFIX.${_pkg_}}/%,%,	\
	    $(or ${PYTHONPATH.${_pkg_}},				\
	      $(addsuffix ..,$(dir $(filter				\
	        %/__init__.py %/__init__.pyc,${SYSTEM_FILES.${_pkg_}})))\
	      $(dir $(filter %.py %.pyc, ${SYSTEM_FILES.${_pkg_}})))))))))
export PYTHONPATH


# Add extra replacement in PLISTs
PLIST_SUBST+=\
	PLIST_PYTHON_SITELIB=$(call quote,${PYTHON_SITELIB})
PLIST_SUBST+=	PYTHON_VERSION=${PYTHON_VERSION}
PRINT_PLIST_AWK_SUBST+=\
	gsub("${PYTHON_SITELIB}/", "$${PYTHON_SITELIB}/");
PRINT_PLIST_AWK_SUBST+=\
	gsub(/$(subst .,\.,${PYTHON_VERSION})/, "$${PYTHON_VERSION}");

# For python packages using the distuils.setup framework, redefine the
# BUILD_MAKE_CMD
ifdef PYDISTUTILSPKG
PYSETUP?=               setup.py
PYSETUPBUILDARGS?=      #empty
PYSETUPINSTALLARGS+=    --prefix=${PREFIX}
PYSETUPOPTARGS?=        -c -O1
_PYSETUPINSTALLARGS=    ${PYSETUPINSTALLARGS} ${PYSETUPOPTARGS} ${_PYSETUPTOOLSINSTALLARGS}

BUILD_MAKE_CMD?=${SETENV} ${MAKE_ENV} \
	${PYTHON} ${PYSETUP} build ${PYSETUPBUILDARGS}

INSTALL_MAKE_CMD?=${SETENV} ${MAKE_ENV} \
	${PYTHON} ${PYSETUP} install ${PYSETUPINSTALLARGS}

endif # PYDISTUTILSPKG

endif # PYTHON_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
