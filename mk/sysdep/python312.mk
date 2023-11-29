# robotpkg sysdep/python312.mk
# Created:			Anthony Mallet on Wed,  4 Jan 2023
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON312_DEPEND_MK:=	${PYTHON312_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python312
endif

ifeq (+,$(PYTHON312_DEPEND_MK)) # -------------------------------------------

DEPEND_USE+=		python312

include ../../mk/sysdep/python.mk
PREFER.python312?=	system

DEPEND_ABI.python312?=	python312>=3.12<3.13

# see sysdep/python.mk for the definition of SYSTEM_SEARCH.python
_py_search312=		{3.12,3,}{,d}{,m}{,u}
SYSTEM_SEARCH.python312=	$(call _py_syssearch,${_py_search312})

SYSTEM_PKG.Fedora.python312=	python3-devel
SYSTEM_PKG.Debian.python312=	python3-dev
SYSTEM_PKG.NetBSD.python312=	lang/python312
SYSTEM_PKG.Gentoo.python312=	'=dev-lang/python-3.12*'

# directory for byte compiled files
PYTHON312_TAG=		.cpython-312
PYTHON312_PYCACHE=	__pycache__

export PYTHON312=	$(firstword ${SYSTEM_FILES.python312})
export PYTHON312_LIB=	$(word 2,${SYSTEM_FILES.python312})
export PYTHON312_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python312}))

endif # PYTHON312_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
