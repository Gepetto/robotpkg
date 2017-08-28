# robotpkg sysdep/python26.mk
# Created:			Anthony Mallet on Mon, 28 Aug 2017
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON36_DEPEND_MK:=	${PYTHON36_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python36
endif

ifeq (+,$(PYTHON36_DEPEND_MK)) # -------------------------------------------

DEPEND_USE+=		python36

include ../../mk/sysdep/python.mk
PREFER.python36?=	system

DEPEND_ABI.python36?=	python36>=3.5<3.6

# see sysdep/python.mk for the definition of SYSTEM_SEARCH.python
_py_search36=		{3.6,3,}{,d}{,m}{,u}
SYSTEM_SEARCH.python36=	$(call _py_syssearch,${_py_search36})

SYSTEM_PKG.Fedora.python36=	python3-devel
SYSTEM_PKG.Debian.python36=	python3-dev
SYSTEM_PKG.NetBSD.python36=	lang/python36
SYSTEM_PKG.Gentoo.python36=	'=dev-lang/python-3.6*'

# directory for byte compiled files
PYTHON36_TAG=		.cpython-36
PYTHON36_PYCACHE=	__pycache__

export PYTHON36=	$(firstword ${SYSTEM_FILES.python36})
export PYTHON36_LIB=	$(word 2,${SYSTEM_FILES.python36})
export PYTHON36_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python36}))

endif # PYTHON36_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
