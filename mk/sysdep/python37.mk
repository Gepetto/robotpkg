# robotpkg sysdep/python37.mk
# Created:			Guilhem Saurel on Thu, 25 Oct 2018
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON37_DEPEND_MK:=	${PYTHON37_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python37
endif

ifeq (+,$(PYTHON37_DEPEND_MK)) # -------------------------------------------

DEPEND_USE+=		python37

include ../../mk/sysdep/python.mk
PREFER.python37?=	system

DEPEND_ABI.python37?=	python37>=3.7<3.8

# see sysdep/python.mk for the definition of SYSTEM_SEARCH.python
_py_search37=		{3.7,3,}{,d}{,m}{,u}
SYSTEM_SEARCH.python37=	$(call _py_syssearch,${_py_search37})

SYSTEM_PKG.Fedora.python37=	python3-devel
SYSTEM_PKG.Debian.python37=	python3-dev
SYSTEM_PKG.NetBSD.python37=	lang/python37
SYSTEM_PKG.Gentoo.python37=	'=dev-lang/python-3.7*'

# directory for byte compiled files
PYTHON37_TAG=		.cpython-37
PYTHON37_PYCACHE=	__pycache__

export PYTHON37=	$(firstword ${SYSTEM_FILES.python37})
export PYTHON37_LIB=	$(word 2,${SYSTEM_FILES.python37})
export PYTHON37_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python37}))

endif # PYTHON37_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
