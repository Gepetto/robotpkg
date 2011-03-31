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
# PYTHON_REQUIRED
#	A list of constraints on python version number used to determine the
#	range of allowed versions of python required by a package. This list
#	should contain patterns suitable for evaluation by "robotpkg_admin
#	pmatch", i.e. optionaly start with >,>=,<= or < and followed by a
#	version number (see robotpkg_info(1)). This value should only be
#	appended to by a package Makefile.
#
# === Defined variables ===
#
# PYPKGPREFIX
#       The prefix to use in PKGNAME for extensions which are meant
#       to be installed for multiple Python versions.
#
#       Example: py25

ifndef LANGUAGE_PYTHON_MK
LANGUAGE_PYTHON_MK:=	defined


# Distill the PYTHON_REQUIRED list into a single _py_required value that is
# the strictest versions of python required.
#
ifdef PYTHON_REQUIRED
  ifndef _pyreqd_${PKGBASE}
    _pyreqd_${PKGBASE}:=$(call preduce,${PYTHON_REQUIRED})
    _py2ok_${PKGBASE}:=$(call preduce,${_pyreqd_${PKGBASE}} <3)
    MAKEOVERRIDES+=_pyreqd_${PKGBASE}=${_pyreqd_${PKGBASE}}
    MAKEOVERRIDES+=_py2ok_${PKGBASE}=${_py2ok_${PKGBASE}}
  endif
else
  # Sensible default value for _py_required
  _pyreqd_${PKGBASE}:= >=2.4<3
  _py2ok_${PKGBASE}:=<3
endif
ifeq (,${_pyreqd_${PKGBASE}})
  PKG_FAIL_REASON+=\
	"The following requirements on python version cannot be satisfied:"
  PKG_FAIL_REASON+=""
  PKG_FAIL_REASON+="	PYTHON_REQUIRED = ${PYTHON_REQUIRED}"
  _pyreqd_${PKGBASE}:= >=2.4<3
  _py2ok_${PKGBASE}:=<3
endif

# Include the depend.mk corresponding to the requirements
ifneq (,${_py2ok_${PKGBASE}})
  _PY2_REQUIRED:= ${_pyreqd_${PKGBASE}}
  include ${ROBOTPKG_DIR}/mk/sysdep/python2.mk
  export PYTHON=	${PYTHON2}
  export PYTHON_INCLUDE=${PYTHON2_INCLUDE}
  export PYTHON_LIB=	${PYTHON2_LIB}
else
  _PY3_REQUIRED:= ${_pyreqd_${PKGBASE}}
  include ${ROBOTPKG_DIR}/lang/python3/depend.mk
  export PYTHON=	${PYTHON3}
  export PYTHON_INCLUDE=${PYTHON3_INCLUDE}
  export PYTHON_LIB=	${PYTHON3_LIB}
endif

# Define some variables
PYTHON_VERSION:=$(if ${PYTHON},$(shell ${PYTHON} 2>/dev/null -c		\
	'import distutils.sysconfig;					\
	print(distutils.sysconfig.get_config_var("VERSION"))'))
PYTHON_SITELIB=$(if ${PYTHON_VERSION},lib/python${PYTHON_VERSION}/site-packages)

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

endif # LANGUAGE_PYTHON_MK
