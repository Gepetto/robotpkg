# robotpkg depend.mk for:	lang/python3
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
PYTHON3_DEPEND_MK:=	${PYTHON3_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python3
endif

ifeq (+,$(PYTHON3_DEPEND_MK)) # --------------------------------------------

PREFER.python3?=	system

DEPEND_USE+=		python3
DEPEND_ABI.python3?=	python3${_PY3_REQUIRED}
DEPEND_DIR.python3?=	../../lang/python3
_PY3_REQUIRED?=		>=3

_py3namespec=python{3,3.0,3.1,[0-9].[0-9],}
SYSTEM_SEARCH.python3=\
	'bin/${_py3namespec}:s/[^.0-9]//gp:% --version' 	\
	'include/${_py3namespec}/patchlevel.h:/PY_VERSION/s/[^.0-9]//gp'	\
	'lib/lib${_py3namespec}.{so,a}:s/^.*python//;s/[^.0-9]//gp:${ECHO} %'

SYSTEM_PKG.Linux-fedora.python3=python-devel
SYSTEM_PKG.NetBSD.python3=	pkgsrc/lang/python

export PYTHON3=		$(firstword ${SYSTEM_FILES.python3})
export PYTHON3_INCLUDE=	$(dir $(word 2,${SYSTEM_FILES.python3}))
export PYTHON3_LIB=	$(word 3,${SYSTEM_FILES.python3})

endif # PYTHON3_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
