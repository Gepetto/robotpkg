# robotpkg sysdep/python38.mk
# Created:			Guilhem Saurel on Thu, 25 Oct 2018
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON38_DEPEND_MK:=	${PYTHON38_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python38
endif

ifeq (+,$(PYTHON38_DEPEND_MK)) # -------------------------------------------

DEPEND_USE+=		python38

include ../../mk/sysdep/python.mk
PREFER.python38?=	system

DEPEND_ABI.python38?=	python38>=3.8<3.9

# see sysdep/python.mk for the definition of SYSTEM_SEARCH.python
_py_search38=		{3.8,3,}{,d}{,m}{,u}
SYSTEM_SEARCH.python38=	$(call _py_syssearch,${_py_search38})

SYSTEM_PKG.Fedora.python38=	python3-devel
SYSTEM_PKG.Debian.python38=	python3-dev
SYSTEM_PKG.NetBSD.python38=	lang/python38
SYSTEM_PKG.Gentoo.python38=	'=dev-lang/python-3.8*'

# directory for byte compiled files
PYTHON38_TAG=		.cpython-38
PYTHON38_PYCACHE=	__pycache__

export PYTHON38=	$(firstword ${SYSTEM_FILES.python38})
export PYTHON38_LIB=	$(word 2,${SYSTEM_FILES.python38})
export PYTHON38_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python38}))

endif # PYTHON38_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
