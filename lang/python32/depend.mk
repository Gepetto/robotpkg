# robotpkg depend.mk for:	lang/python32
# Created:			Anthony Mallet on Wed, 21 Sep 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON32_DEPEND_MK:=	${PYTHON32_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python32
endif

ifeq (+,$(PYTHON32_DEPEND_MK)) # -------------------------------------------

DEPEND_USE+=		python32

include ../../mk/sysdep/python.mk
PREFER.python32?=	${PREFER.python}

DEPEND_ABI.python32?=	python32>=3.2<3.3

# see sysdep/python.mk for the definition of SYSTEM_SEARCH.python
_py_search32=		{3.2,3,}{,d}{,m}{,u}
SYSTEM_SEARCH.python32=	$(call _py_syssearch,${_py_search32})

SYSTEM_PKG.Fedora.python32=	python3.2-devel
SYSTEM_PKG.Ubuntu.python32=	python3.2-dev
SYSTEM_PKG.Debian.python32=	python3.2-dev
SYSTEM_PKG.NetBSD.python32=	pkgsrc/lang/python32

# directory for byte compiled files
PYTHON32_TAG=		.cpython-32
PYTHON32_PYCACHE=	__pycache__

export PYTHON32=	$(firstword ${SYSTEM_FILES.python32})
export PYTHON32_LIB=	$(word 2,${SYSTEM_FILES.python32})
export PYTHON32_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python32}))

endif # PYTHON32_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
