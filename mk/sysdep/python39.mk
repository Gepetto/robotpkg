# robotpkg sysdep/python39.mk
# Created:			Guilhem Saurel on Thu, 3 Dec 2020
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON39_DEPEND_MK:=	${PYTHON39_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python39
endif

ifeq (+,$(PYTHON39_DEPEND_MK)) # -------------------------------------------

DEPEND_USE+=		python39

include ../../mk/sysdep/python.mk
PREFER.python39?=	system

DEPEND_ABI.python39?=	python39>=3.9<3.10

# see sysdep/python.mk for the definition of SYSTEM_SEARCH.python
_py_search39=		{3.9,3,}{,d}{,m}{,u}
SYSTEM_SEARCH.python39=	$(call _py_syssearch,${_py_search39})

SYSTEM_PKG.Fedora.python39=	python3-devel
SYSTEM_PKG.Debian.python39=	python3-dev
SYSTEM_PKG.NetBSD.python39=	lang/python39
SYSTEM_PKG.Gentoo.python39=	'=dev-lang/python-3.9*'

# directory for byte compiled files
PYTHON39_TAG=		.cpython-39
PYTHON39_PYCACHE=	__pycache__

export PYTHON39=	$(firstword ${SYSTEM_FILES.python39})
export PYTHON39_LIB=	$(word 2,${SYSTEM_FILES.python39})
export PYTHON39_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python39}))

endif # PYTHON39_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
