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

# Sensible default value for _PYTHON_REQUIRED
#
_PY_REQUIRED?=	>=2.4<3

# Distill the PYTHON_REQUIRED list into a single _PY_REQUIRED value that is
# the strictest versions of python required.
#
ifdef PYTHON_REQUIRED
  _PY_REQUIRED:=$(call versionreqd,${PYTHON_REQUIRED})
endif
ifeq (,$(_PY_REQUIRED))
  PKG_FAIL_REASON+=\
	"The following requirements on python version cannot be satisfied:"
  PKG_FAIL_REASON+=""
  PKG_FAIL_REASON+="	PYTHON_REQUIRED = ${PYTHON_REQUIRED}"
  _PY_REQUIRED:= >=2.4<3
endif


# Include the depend.mk corresponding to the requirements
ifeq (yes,$(shell ${PKG_ADMIN} pmatch 'x${_PY_REQUIRED}' 'x-3' && echo yes))
  include ${ROBOTPKG_DIR}/lang/python3/depend.mk
else
  include ${ROBOTPKG_DIR}/mk/sysdep/python2.mk
endif

# Define some variables
PYTHON_VERSION=$(if ${PYTHON},$(shell ${PYTHON} 2>/dev/null -c 		\
	'import distutils.sysconfig;					\
	print(distutils.sysconfig.get_config_var("VERSION"))'))
PYTHON_SITELIB=$(if ${PYTHON_VERSION},lib/python${PYTHON_VERSION}/site-packages)
export PYTHONPATH:=$(call prependpaths,${PREFIX}/${PYTHON_SITELIB},${PYTHONPATH})

PLIST_SUBST+=	PYTHON_VERSION=${PYTHON_VERSION}
PRINT_PLIST_AWK_SUBST+=\
	gsub(/$(subst .,\.,${PYTHON_VERSION})/, "$${PYTHON_VERSION}");

# Add extra replacement in PLISTs
PLIST_SUBST+=\
	PLIST_PYTHON_SITELIB=$(call quote,${PYTHON_SITELIB})
PRINT_PLIST_AWK_SUBST+=\
	gsub("${PYTHON_SITELIB}/", "$${PYTHON_SITELIB}/");

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
