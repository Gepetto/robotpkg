# robotpkg depend.mk for:	lang/python31
# Created:			Séverin Lemaignan on Mon, 7 Dec 2009
#

#
# This Makefile fragment defines additional variables that are used
# by packages that need python.
#
# Optional variables that may be defined by the package are:
#
#	PYTHON_REQUIRED is the version of python required, e.g. ">=3.1".
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON31_DEPEND_MK:=	${PYTHON31_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python31
endif

ifeq (+,$(PYTHON31_DEPEND_MK)) # -------------------------------------------

DEPEND_USE+=		python31

PREFER.python31?=	system

DEPEND_USE+=           python31
DEPEND_ABI.python31?=	python31${_PY3_REQUIRED}
DEPEND_DIR.python31?=	../../lang/python31
_PY3_REQUIRED?=		>=3

_py3namespec=python{3,3.0,3.1,3.2,[0-9].[0-9],}
SYSTEM_SEARCH.python31=\
  'bin/${_py3namespec}:s/[^.0-9]//gp:% --version'			\
  'include/${_py3namespec}{,{,d}mu}/patchlevel.h:/PY_VERSION/s/[^.0-9]//gp' \
  'lib/lib${_py3namespec}{,{,d}mu}.{so,a}:s/^.*python//;s/[^.0-9]//g;s/[.]$$//;p:${ECHO} %'

SYSTEM_PKG.Linux-fedora.python31=	python3.1-devel
SYSTEM_PKG.Linux-ubuntu.python31=	python3.1-dev
SYSTEM_PKG.Linux-debian.python31=	python3.1-dev
SYSTEM_PKG.NetBSD.python31=		pkgsrc/lang/python31

export PYTHON31=	$(firstword ${SYSTEM_FILES.python31})
export PYTHON31_LIB=	$(word 2,${SYSTEM_FILES.python31})
export PYTHON31_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python31}))

endif # PYTHON31_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
