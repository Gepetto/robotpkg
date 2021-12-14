# robotpkg sysdep/python310.mk
# Created:			Guilhem Saurel on Tue, 14 Dec 2021
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON310_DEPEND_MK:=	${PYTHON310_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python310
endif

ifeq (+,$(PYTHON310_DEPEND_MK)) # -------------------------------------------

DEPEND_USE+=		python310

include ../../mk/sysdep/python.mk
PREFER.python310?=	system

DEPEND_ABI.python310?=	python310>=3.10<3.11

# see sysdep/python.mk for the definition of SYSTEM_SEARCH.python
_py_search310=		{3.10,3,}{,d}{,m}{,u}
SYSTEM_SEARCH.python310=	$(call _py_syssearch,${_py_search310})

SYSTEM_PKG.Fedora.python310=	python3-devel
SYSTEM_PKG.Debian.python310=	python3-dev
SYSTEM_PKG.NetBSD.python310=	lang/python310
SYSTEM_PKG.Gentoo.python310=	'=dev-lang/python-3.10*'

# directory for byte compiled files
PYTHON310_TAG=		.cpython-310
PYTHON310_PYCACHE=	__pycache__

export PYTHON310=	$(firstword ${SYSTEM_FILES.python310})
export PYTHON310_LIB=	$(word 2,${SYSTEM_FILES.python310})
export PYTHON310_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python310}))

endif # PYTHON310_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
