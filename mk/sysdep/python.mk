#
# Copyright (c) 2010-2012 LAAS/CNRS
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
# PREFER_ALTERNATIVE.python
#	The preferred Python interpreters/versions to use. The
#	order of the entries matters, since earlier entries are
#	preferred over later ones.
#
#	Possible values: python25 python26 python27 python31 python32
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
# PKGTAG.python
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
  DEPEND_PKG+=		${PKG_ALTERNATIVE.python}
endif

ifeq (+,$(PYTHON_DEPEND_MK)) # ---------------------------------------------

DEPEND_USE+=		${PKG_ALTERNATIVE.python}

PREFER.python?=		system
DEPEND_ABI.python?=	python>=2.5<3.3

# factorize SYSTEM_SEARCH.python* here for all python* packages
override define _py_syssearch
  'bin/python$1:s/[^.0-9]//gp:% --version'				\
  'lib/libpython$1.{so,a}:s@^.*/@@;s/[^.0-9]//g;s/[.]$$//;p:${ECHO} %'	\
  'include/python$1/patchlevel.h:/PY_VERSION/s/[^.0-9]//gp'
endef
# define some variables for use in the packages
export PYTHON=$(firstword ${SYSTEM_FILES.${PKG_ALTERNATIVE.python}})
export PYTHON_LIB=$(word 2,${SYSTEM_FILES.${PKG_ALTERNATIVE.python}})
export PYTHON_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.${PKG_ALTERNATIVE.python}}))


# define an alternative for available pythons packages
PKG_ALTERNATIVES+=		python
PKG_ALTERNATIVES.python=	python25 python26 python27 python31 python32

# select default preferences depending on OS/VERSION
include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Fedora,${OPSYS})
  ifneq (,$(filter 14,${OS_VERSION}))
    PREFER_ALTERNATIVE.python?=	python27 python31 python32
  else
    PREFER_ALTERNATIVE.python?=	python27 python32 python31
  endif
else ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 10.04 10.10,${OS_VERSION}))
    PREFER_ALTERNATIVE.python?=	python26 python31 python32
  else ifneq (,$(filter 11.04 11.10,${OS_VERSION}))
    PREFER_ALTERNATIVE.python?=	python27 python26 python32 python31
  else
    PREFER_ALTERNATIVE.python?=	python27 python32 python31
  endif
endif
PREFER_ALTERNATIVE.python?=	python26 python27 python31 python32

PKG_ALTERNATIVE_DESCR.python25= Use python-2.5
PKGTAG.python25=		py25
define PKG_ALTERNATIVE_SELECT.python25
  $(call preduce,${DEPEND_ABI.python} python>=2.5<2.6)
endef
define PKG_ALTERNATIVE_SET.python25
  _py_abi:=$(subst python,python25,${PKG_ALTERNATIVE_SELECT.python25})
  DEPEND_ABI.python25?=	$(strip ${_py_abi})

  include ../../mk/sysdep/python25.mk
endef

PKG_ALTERNATIVE_DESCR.python26= Use python-2.6
PKGTAG.python26 =		py26
define PKG_ALTERNATIVE_SELECT.python26
  $(call preduce,${DEPEND_ABI.python} python>=2.6<2.7)
endef
define PKG_ALTERNATIVE_SET.python26
  _py_abi:=$(subst python,python26,${PKG_ALTERNATIVE_SELECT.python26})
  DEPEND_ABI.python26?=	$(strip ${_py_abi})

  include ../../mk/sysdep/python26.mk
endef

PKG_ALTERNATIVE_DESCR.python27= Use python-2.7
PKGTAG.python27 =		py27
define PKG_ALTERNATIVE_SELECT.python27
  $(call preduce,${DEPEND_ABI.python} python>=2.7<2.8)
endef
define PKG_ALTERNATIVE_SET.python27
  _py_abi:=$(subst python,python27,${PKG_ALTERNATIVE_SELECT.python27})
  DEPEND_ABI.python27?=	$(strip ${_py_abi})

  include ../../mk/sysdep/python27.mk
endef

PKG_ALTERNATIVE_DESCR.python31= Use python-3.1
PKGTAG.python31 =		py31
define PKG_ALTERNATIVE_SELECT.python31
  $(call preduce,${DEPEND_ABI.python} python>=3.1<3.2)
endef
define PKG_ALTERNATIVE_SET.python31
  _py_abi:=$(subst python,python31,${PKG_ALTERNATIVE_SELECT.python31})
  DEPEND_ABI.python31?=	$(strip ${_py_abi})

  include ../../lang/python31/depend.mk
endef

PKG_ALTERNATIVE_DESCR.python32= Use python-3.2
PKGTAG.python32 =		py32
define PKG_ALTERNATIVE_SELECT.python32
  $(call preduce,${DEPEND_ABI.python} python>=3.2<3.3)
endef
define PKG_ALTERNATIVE_SET.python32
  _py_abi:=$(subst python,python32,${PKG_ALTERNATIVE_SELECT.python32})
  DEPEND_ABI.python32?=	$(strip ${_py_abi})

  include ../../lang/python32/depend.mk
endef


# require preferences for PYTHON definition and immediate expansions below
include ../../mk/robotpkg.prefs.mk

PYTHON_VERSION=$(patsubst py2%,2.%,$(patsubst py3%,3.%,${PKGTAG.python}))
BUILD_DEFS+=		PYTHON_VERSION
PYTHON_MAJOR=		$(word 1,$(subst ., ,${PYTHON_VERSION}))

PYTHON_SITELIB=		lib/python${PYTHON_VERSION}/site-packages

_pyver=		python{${PYTHON_VERSION},${PYTHON_MAJOR}}
_pyshared=	py$(subst 2,,${PYTHON_MAJOR})shared
_pysyssearch_1=\
  lib/${_pyver}/{site,dist}-packages
_pysyssearch_2=\
  $(if $(filter Ubuntu,${OPSYS}),$(strip ${_comma}share/${_pyshared}))
_pysyssearch_3=\
  $(if $(filter Ubuntu,${OPSYS}),$(strip ${_comma}lib/${_pyshared}/${_pyver}))
_pysyssearch_4=\
  $(if $(filter Ubuntu,${OPSYS}),$(strip ${_comma}share/python-support))

PYTHON_SYSLIBSEARCH=\
	{${_pysyssearch_1}${_pysyssearch_2}${_pysyssearch_3}${_pysyssearch_4}}

PYVARPREFIX=		$(subst python,PYTHON,${PKG_ALTERNATIVE.python})
PYTHON_PYCACHE?=	$(or ${${PYVARPREFIX}_PYCACHE},.)
PYTHON_TAG?=		$(or ${${PYVARPREFIX}_TAG},)

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
	     )))))))
export PYTHONPATH


# Add extra replacement in PLISTs
PLIST_SUBST+=\
	PLIST_PYTHON_PYCACHE=$(call quote,${PYTHON_PYCACHE})		\
	PLIST_PYTHON_SITELIB=$(call quote,${PYTHON_SITELIB})		\
	PLIST_PYTHON_TAG=$(call quote,${PYTHON_TAG})			\
	PYTHON_VERSION=${PYTHON_VERSION}

PRINT_PLIST_AWK_SUBST+=\
	gsub("/${PYTHON_PYCACHE}/", "/");				\
	gsub("[^/]+[.]py[co]$$", "$${PYTHON_PYCACHE}/&");		\
	$(if ${PYTHON_TAG},gsub("${PYTHON_TAG}.py", ".py");)		\
	gsub("[.]py[co]$$", "$${PYTHON_TAG}&");				\
	gsub("${PYTHON_SITELIB}/", "$${PYTHON_SITELIB}/");		\
	gsub(/$(subst .,\.,${PYTHON_VERSION})/, "$${PYTHON_VERSION}");

# Define a post-plist hook to compile all .py files
ifndef PYTHON_NO_PLIST_COMPILE
  PYTHON_PLIST_COMPILE_PATTERN?=\
	/share[\/].*[.]py$$/ || /lib[\/].*[.]py$$/

  post-plist: python-compile-plist

  .PHONY: python-compile-plist
  python-compile-plist:
	@${STEP_MSG} "Compiling python files"
	${RUN} ${INSTALL_LOGFILTER} ${AWK} '				\
	  BEGIN {							\
	    compile = "${PYTHON}";					\
	    ocompile = "${PYTHON} -O";					\
	    pre = "py_compile.compile(\"${PREFIX}/";			\
	    post = "\")";						\
	    print "import py_compile" | compile;			\
	    print "import py_compile" | ocompile;			\
	  }								\
	  ${PYTHON_PLIST_COMPILE_PATTERN} {				\
	    print pre $$0 post | compile;				\
	    print pre $$0 post | ocompile;				\
	  }								\
	  END {								\
	    if (close(compile) || close(ocompile)) { exit 2 }		\
	  }								\
	' ${PLIST}
endif

# Define package helper targets to compile .py files
.PHONY: python-compile-all
python-compile-all: python-compile-all(${WRKSRC})
python-compile-all(%): .FORCE
	${RUN}${INSTALL_LOGFILTER} ${PYTHON} -m compileall -f $%
	${RUN}${INSTALL_LOGFILTER} ${PYTHON} -O -m compileall -f $%

python-compile-file(%): .FORCE
	${RUN}${INSTALL_LOGFILTER} ${PYTHON} -c 'import py_compile;	\
	  py_compile.compile("$%");'
	${RUN}${INSTALL_LOGFILTER} ${PYTHON} -O -c 'import py_compile;	\
	  py_compile.compile("$%");'

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
