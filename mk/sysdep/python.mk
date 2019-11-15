#
# Copyright (c) 2010-2019 LAAS/CNRS
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
#	Possible values: python27 python34 python35 python36 python37 python38
#
# === Package-settable variables ===
#
# DEPEND_ABI.python
#	The Python versions that are acceptable for the package.
#
#	Possible values: any pattern
#	Default: python>=2.6 python<3
#
# PYTHON_SELF_CONFLICT
#       If set to "yes", additional CONFLICTS entries are added for
#       registering a conflict between pyNN-<modulename> packages.
#
#       Possible values: yes no
#       Default: no
#
# PYTHON_NOTAG_CONFLICT
#       If set to "yes", additional CONFLICTS entries are added for
#       registering a conflict with the package name without pyNN- prefix.
#
#       Possible values: yes no
#       Default: no
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
DEPEND_ABI.python?=	python>=2.5<3.9

# factorize SYSTEM_SEARCH.python* here for all python* packages
override define _py_syssearch
  'bin/python$1:s/[^.0-9]//gp:% --version'				\
  'lib/libpython$1.{so,a}:s@^.*/@@;s/[^.0-9]//g;s/[.]$$//;p:${ECHO} %'	\
  'include/python$1/patchlevel.h:/PY_VERSION/s/[^.0-9]//gp'		\
  'include/python$1/pyconfig.h'
endef
# define some variables for use in the packages
export PYTHON=$(firstword ${SYSTEM_FILES.${PKG_ALTERNATIVE.python}})
export PYTHON_LIB=$(word 2,${SYSTEM_FILES.${PKG_ALTERNATIVE.python}})
export PYTHON_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.${PKG_ALTERNATIVE.python}}))
export PYTHON_INCLUDE_CONFIG=\
  $(dir $(word 4,${SYSTEM_FILES.${PKG_ALTERNATIVE.python}}))

# For cmake/FindPython users. Recent cmake (at least 2.8.11) use the
# internal PYTHON_INCLUDE_DIR2 for pyconfig.h, which is installed apart on
# debian systems. But it's not always properly defined when one passes
# PYTHON_INCLUDE_DIR. Sigh.
# See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=709181
#
CMAKE_ARGS+=	-DPYTHON_EXECUTABLE=${PYTHON}
CMAKE_ARGS+=	-DPYTHON_INCLUDE_DIR=${PYTHON_INCLUDE}
CMAKE_ARGS+=	-DPYTHON_INCLUDE_DIR2=${PYTHON_INCLUDE_CONFIG}
CMAKE_ARGS+=	-DPYTHON_LIBRARY=${PYTHON_LIB}

# Additional CONFLICTS
ifneq (,$(call isyes,${PYTHON_SELF_CONFLICT}))
  CONFLICTS_SUBST+=	${PKGTAG.python-}=py[0-9][0-9]-
  CONFLICTS+=		${PKGWILDCARD}
endif
ifneq (,$(call isyes,${PYTHON_NOTAG_CONFLICT}))
  CONFLICTS+=		$(subst ${PKGTAG.python-},,${PKGWILDCARD})
endif

# define an alternative for available pythons packages
PKG_ALTERNATIVES+=		python
PKG_ALTERNATIVES.python=	python27
PKG_ALTERNATIVES.python+=	python34 python35 python36 python37 python38

# select default preferences depending on OS/VERSION
include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Debian,${OPSYS})
  ifneq (,$(filter 8,${OS_VERSION}))
    PREFER_ALTERNATIVE.python?=	python27 python34
  endif
  PREFER_ALTERNATIVE.python?=	python27 python35
else ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 14.04,${OS_VERSION}))
    PREFER_ALTERNATIVE.python?=	python27 python34
  endif
  ifneq (,$(filter 16.04,${OS_VERSION}))
    PREFER_ALTERNATIVE.python?=	python27 python35
  endif
  ifneq (,$(filter 18.04,${OS_VERSION}))
    PREFER_ALTERNATIVE.python?=	python27 python36
  endif
  PREFER_ALTERNATIVE.python?=	python27 python37
else ifeq (CentOS,${OPSYS})
  PREFER_ALTERNATIVE.python?=	python27 python34
else ifeq (Arch,${OPSYS})
  PREFER_ALTERNATIVE.python?=	python27 python38
endif
PREFER_ALTERNATIVE.python?=	python27 python36

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

PKG_ALTERNATIVE_DESCR.python34= Use python-3.4
PKGTAG.python34 =		py34
define PKG_ALTERNATIVE_SELECT.python34
  $(call preduce,${DEPEND_ABI.python} python>=3.4<3.5)
endef
define PKG_ALTERNATIVE_SET.python34
  _py_abi:=$(subst python,python34,${PKG_ALTERNATIVE_SELECT.python34})
  DEPEND_ABI.python34?=	$(strip ${_py_abi})

  include ../../mk/sysdep/python34.mk
endef

PKG_ALTERNATIVE_DESCR.python35= Use python-3.5
PKGTAG.python35 =		py35
define PKG_ALTERNATIVE_SELECT.python35
  $(call preduce,${DEPEND_ABI.python} python>=3.5<3.6)
endef
define PKG_ALTERNATIVE_SET.python35
  _py_abi:=$(subst python,python35,${PKG_ALTERNATIVE_SELECT.python35})
  DEPEND_ABI.python35?=	$(strip ${_py_abi})

  include ../../mk/sysdep/python35.mk
endef

PKG_ALTERNATIVE_DESCR.python36= Use python-3.6
PKGTAG.python36 =		py36
define PKG_ALTERNATIVE_SELECT.python36
  $(call preduce,${DEPEND_ABI.python} python>=3.6<3.7)
endef
define PKG_ALTERNATIVE_SET.python36
  _py_abi:=$(subst python,python36,${PKG_ALTERNATIVE_SELECT.python36})
  DEPEND_ABI.python36?=	$(strip ${_py_abi})

  include ../../mk/sysdep/python36.mk
endef

PKG_ALTERNATIVE_DESCR.python37= Use python-3.7
PKGTAG.python37 =		py37
define PKG_ALTERNATIVE_SELECT.python37
  $(call preduce,${DEPEND_ABI.python} python>=3.7<3.8)
endef
define PKG_ALTERNATIVE_SET.python37
  _py_abi:=$(subst python,python37,${PKG_ALTERNATIVE_SELECT.python37})
  DEPEND_ABI.python37?=	$(strip ${_py_abi})

  include ../../mk/sysdep/python37.mk
endef

PKG_ALTERNATIVE_DESCR.python38= Use python-3.8
PKGTAG.python38 =		py38
define PKG_ALTERNATIVE_SELECT.python38
  $(call preduce,${DEPEND_ABI.python} python>=3.8<3.9)
endef
define PKG_ALTERNATIVE_SET.python38
  _py_abi:=$(subst python,python38,${PKG_ALTERNATIVE_SELECT.python38})
  DEPEND_ABI.python38?=	$(strip ${_py_abi})

  include ../../mk/sysdep/python38.mk
endef

# default tag value before alternative resolution (used in particular by
# PKG_OPTIONS_VAR)
PKGTAG.python=	py
-PKGTAG.python=	-${PKGTAG.python}
PKGTAG.python-=	${PKGTAG.python}-

# require preferences for PYTHON definition and immediate expansions below
include ../../mk/robotpkg.prefs.mk

PYTHON_VERSION=$(patsubst py2%,2.%,$(patsubst py3%,3.%,${PKGTAG.python}))
BUILD_DEFS+=		PYTHON_VERSION
PYTHON_MAJOR=		$(word 1,$(subst ., ,${PYTHON_VERSION}))

PYTHON_SITELIB=		lib/python${PYTHON_VERSION}/site-packages

_pyver=		python{${PYTHON_VERSION},${PYTHON_MAJOR}}
_pysyssearch_1=\
  lib/${_pyver}/{site,dist}-packages
_pysyssearch_2=\
  $(if $(filter Debian,${OS_FAMILY}),$(strip ${_comma}lib/pymodules/${_pyver}))

PYTHON_SYSLIBSEARCH=	{${_pysyssearch_1}${_pysyssearch_2}}

PYVARPREFIX=		$(subst python,PYTHON,${PKG_ALTERNATIVE.python})
PYTHON_PYCACHE?=	$(or ${${PYVARPREFIX}_PYCACHE},)
PYTHON_TAG?=		$(or ${${PYVARPREFIX}_TAG},)

PYTHON_SYSLIB:=$(if ${PYTHON},$(shell ${PYTHON} 2>/dev/null -c		\
	'import distutils.sysconfig;                                    \
	print(distutils.sysconfig.get_python_lib(0, 0, ""))'))

# Python library extension: expand to an error until dependency resolution
# has completed and a PYTHON program is available, so that the variable is not
# referenced by mistake.
#
PYTHON_EXT_SUFFIX=$(if ${PYTHON},$(eval					\
  PYTHON_EXT_SUFFIX:=$$(shell ${PYTHON} 2>/dev/null -c			\
    'import sysconfig; print(sysconfig.get_config_var("SO"));'		\
  ))${PYTHON_EXT_SUFFIX},						\
  $(error PYTHON_EXT_SUFFIX referenced before dependency resolution))

# PYTHONPATH.<pkg> is a list of subdirectories of PREFIX.<pkg> (or absolute
# directories) that should be added to the python search paths.
#
_PYTHON_SYSPATH:=$(if ${PYTHON},					\
  $(shell ${SETENV} HOME=${WRKDIR} PYTHONPATH= ${PYTHON} 2>/dev/null -c	\
	'import sys; print(" ".join(sys.path))'))

PYTHONPATH=$(call prependpaths, $(filter-out ${_PYTHON_SYSPATH},	\
	$(realpath $(foreach _pkg_,${DEPEND_USE},			\
	  $(addprefix							\
	    ${PREFIX.${_pkg_}}/, $(patsubst ${PREFIX.${_pkg_}}/%,%,	\
	    $(or ${PYTHONPATH.${_pkg_}},				\
	      $(addsuffix ..,$(dir $(filter				\
	        %/__init__.py %/__init__.pyc,${SYSTEM_FILES.${_pkg_}})))\
	     )))))))
export PYTHONPATH


# Replace python interpreter in source files
SUBST_STAGE.py-interp=	pre-configure
SUBST_MESSAGE.py-interp=Replacing python interpreter path
SUBST_SED.py-interp=	-e '1s|^\\\#!.*python[0-9.]*|\\\#!${PYTHON}|'
SUBST_SED.py-interp+=	-e 's|@PYTHON@|${PYTHON}|'

# Add extra replacement in PLISTs
PLIST_SUBST+=\
	PLIST_PYTHON_PYCACHE=$(call quote,${PYTHON_PYCACHE})		\
	PLIST_PYTHON_SITELIB=$(call quote,${PYTHON_SITELIB})		\
	PLIST_PYTHON_TAG=$(call quote,${PYTHON_TAG})			\
	PLIST_PYTHON_EXT_SUFFIX=$(call quote,${PYTHON_EXT_SUFFIX})	\
	PYTHON_VERSION=${PYTHON_VERSION}

PRINT_PLIST_AWK_SUBST+=\
	gsub("${PYTHON_SITELIB}/", "$${PYTHON_SITELIB}/");		\
	gsub(/$(subst .,\.,${PYTHON_VERSION})/, "$${PYTHON_VERSION}");	\
	$(if ${PYTHON_EXT_SUFFIX},					\
	  if (/[$$]{PYTHON_SITELIB}/)					\
	    gsub("$(subst .,[.],${PYTHON_EXT_SUFFIX})",			\
	      "$${PYTHON_EXT_SUFFIX}");)

# Only for backward compatibility: .py{c,o} files are not explicitly in PLISTs
PLIST_SUBST+=\
	PLIST_PYTHON_PYCACHE=$(call quote,${PYTHON_PYCACHE})		\
	PLIST_PYTHON_TAG=$(call quote,${PYTHON_TAG})			\

# Prevent from automatically compiling files - might clutter PLIST if
# installation involves a python execution. Compilation is handled by the
# post-PLIST hook below.
export PYTHONDONTWRITEBYTECODE=1

# Define a post-plist hook to compile all .py files and a plist filter to
# include .py{c,o} in the PLIST
ifndef PYTHON_NO_PLIST_COMPILE
  PYTHON_PLIST_COMPILE_PATTERN?=\
	/share[\/].*[.]py$$/ || /lib[\/].*[.]py$$/

  post-plist: python-compile-plist

  .PHONY: python-compile-plist
  python-compile-plist:
	@${STEP_MSG} "Compiling python files"
	${RUN} ${AWK} '							\
	  BEGIN {							\
	    compile = "${PYTHON}";					\
	    ocompile = "${PYTHON} -O";					\
	    pre = "py_compile.compile(\"${PREFIX}/";			\
	    post = "\")";						\
	    print "import py_compile" | compile;			\
	    print "import py_compile" | ocompile;			\
	  }								\
	  !( ${PYTHON_PLIST_COMPILE_PATTERN} ) { next }			\
	  system("${TEST} -f \"${PREFIX}/" $$0 "\"") {			\
	    system("${ECHO} >&2 \"File " $$0 " could not be found\"");	\
	    next							\
	  }								\
	  {								\
	    print pre $$0 post | compile;				\
	    print pre $$0 post | ocompile;				\
	  }								\
	  END {								\
	    if (close(compile) || close(ocompile)) { exit 2 }		\
	  }								\
	' ${PLIST}

  PLIST_FILTER+=| ${AWK} '						\
    { print }								\
    ( ${PYTHON_PLIST_COMPILE_PATTERN} ) {				\
      sub("[.][^/]*py$$", ".py");					\
      $(if ${PYTHON_PYCACHE},						\
        gsub("[^/]+[.]py$$", "${PYTHON_PYCACHE}/&");)			\
      $(if ${PYTHON_TAG},gsub("[.]py$$", "${PYTHON_TAG}&");)		\
      print $$0 "c";							\
      if ($(subst python,,${PKG_ALTERNATIVE.python})>=35) {		\
        gsub("[.]py$$", "");						\
        print $$0 ".opt-1.pyc";						\
      } else								\
        print $$0 "o";							\
    }'

  PRINT_PLIST_FILTER+=| ${AWK} '					\
    ! /.py[co]$$/ { print; next; }					\
    {									\
      orig=$$0;								\
      gsub(".opt-[12].pyc$$", ".pyc");					\
      gsub("${PYTHON_TAG}[.]py[co]$$", ".py");				\
      $(if ${PYTHON_PYCACHE},gsub("${PYTHON_PYCACHE}","");)		\
    }									\
    ! ( ${PYTHON_PLIST_COMPILE_PATTERN} ) { print orig; }'
endif

# Define package helper targets to compile .py files
.PHONY: python-compile-all
python-compile-all: python-compile-all(${WRKSRC})
python-compile-all(%): .FORCE
	${RUN} ${PYTHON} -m compileall -f $%
	${RUN} ${PYTHON} -O -m compileall -f $%

python-compile-file(%): .FORCE
	${RUN} ${PYTHON} -c 'import py_compile; py_compile.compile("$%");'
	${RUN} ${PYTHON} -O -c 'import py_compile; py_compile.compile("$%");'

# For python packages using the distuils.setup framework, redefine the
# BUILD_MAKE_CMD
ifdef PYDISTUTILSPKG
PYSETUP?=               setup.py
PYSETUPBUILDARGS?=      #empty
PYSETUPINSTALLARGS+=    --prefix=${PREFIX}
PYSETUPINSTALLARGS+=    --install-lib=${PREFIX}/${PYTHON_SITELIB}
PYSETUPINSTALLARGS+=    --no-compile

BUILD_MAKE_CMD?=${SETENV} ${MAKE_ENV} \
	${PYTHON} ${PYSETUP} build ${PYSETUPBUILDARGS}

INSTALL_MAKE_CMD?=${SETENV} ${MAKE_ENV} \
	${PYTHON} ${PYSETUP} install ${PYSETUPINSTALLARGS}

endif # PYDISTUTILSPKG

endif # PYTHON_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
