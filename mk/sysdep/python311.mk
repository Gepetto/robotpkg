# robotpkg sysdep/python311.mk
# Created:			Anthony Mallet on Wed,  4 Jan 2023
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON311_DEPEND_MK:=	${PYTHON311_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python311
endif

ifeq (+,$(PYTHON311_DEPEND_MK)) # -------------------------------------------

DEPEND_USE+=		python311

include ../../mk/sysdep/python.mk
PREFER.python311?=	system

DEPEND_ABI.python311?=	python311>=3.10<3.11

# see sysdep/python.mk for the definition of SYSTEM_SEARCH.python
_py_search311=		{3.11,3,}{,d}{,m}{,u}
SYSTEM_SEARCH.python311=	$(call _py_syssearch,${_py_search311})

SYSTEM_PKG.Fedora.python311=	python3-devel
SYSTEM_PKG.Debian.python311=	python3-dev
SYSTEM_PKG.NetBSD.python311=	lang/python311
SYSTEM_PKG.Gentoo.python311=	'=dev-lang/python-3.11*'

# directory for byte compiled files
PYTHON311_TAG=		.cpython-311
PYTHON311_PYCACHE=	__pycache__

export PYTHON311=	$(firstword ${SYSTEM_FILES.python311})
export PYTHON311_LIB=	$(word 2,${SYSTEM_FILES.python311})
export PYTHON311_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python311}))

endif # PYTHON311_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
