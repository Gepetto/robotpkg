# robotpkg sysdep/python33.mk
# Created:			Anthony Mallet on Tue Apr  9 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON33_DEPEND_MK:=	${PYTHON33_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python33
endif

ifeq (+,$(PYTHON33_DEPEND_MK)) # -------------------------------------------

DEPEND_USE+=		python33

include ../../mk/sysdep/python.mk
PREFER.python33?=	${PREFER.python}

DEPEND_ABI.python33?=	python33>=3.3<3.4

# see sysdep/python.mk for the definition of SYSTEM_SEARCH.python
_py_search33=		{3.3,3,}{,d}{,m}{,u}
SYSTEM_SEARCH.python33=	$(call _py_syssearch,${_py_search33})

SYSTEM_PKG.Fedora.python33=	python3-devel
SYSTEM_PKG.Ubuntu.python33=	python3.3-dev
SYSTEM_PKG.Debian.python33=	python3.3-dev
SYSTEM_PKG.NetBSD.python33=	pkgsrc/lang/python33

# directory for byte compiled files
PYTHON33_TAG=		.cpython-33
PYTHON33_PYCACHE=	__pycache__

export PYTHON33=	$(firstword ${SYSTEM_FILES.python33})
export PYTHON33_LIB=	$(word 2,${SYSTEM_FILES.python33})
export PYTHON33_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python33}))

endif # PYTHON33_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
