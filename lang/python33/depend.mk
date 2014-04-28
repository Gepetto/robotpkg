# robotpkg depend.mk for:	lang/python33
# Created:			Anthony Mallet on Tue, 10 Mar 2014
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON33_DEPEND_MK:=	${PYTHON33_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python33
endif

ifeq (+,$(PYTHON33_DEPEND_MK)) # -------------------------------------------

DEPEND_USE+=		python33

include ../../mk/sysdep/python.mk
ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 12.04 14.04,${OS_VERSION}))
    PREFER.python33?=	robotpkg
  endif
else ifeq (Debian,${OPSYS})
  ifneq (,$(filter 7.%,${OS_VERSION}))
    PREFER.python33?=	robotpkg
  endif
else ifeq (OpenNao,${OPSYS})
  ifneq (,$(filter 1.14.%,${OS_VERSION}))
    PREFER.python33?=	robotpkg
  endif
endif
PREFER.python33?=	${PREFER.python}

DEPEND_ABI.python33?=	python33>=3.3<3.4
DEPEND_DIR.python33?=	../../lang/python33

# see sysdep/python.mk for the definition of SYSTEM_SEARCH.python
_py_search33=		{3.3,3,}{,d}{,m}{,u}
SYSTEM_SEARCH.python33=	$(call _py_syssearch,${_py_search33})

SYSTEM_PKG.Fedora.python33=	python3.3-devel
SYSTEM_PKG.Debian.python33=	python3.3-dev
SYSTEM_PKG.NetBSD.python33=	lang/python33
SYSTEM_PKG.Gentoo.python33=	'=dev-lang/python-3.3*'

# directory for byte compiled files
PYTHON33_TAG=		.cpython-33
PYTHON33_PYCACHE=	__pycache__

export PYTHON33=	$(firstword ${SYSTEM_FILES.python33})
export PYTHON33_LIB=	$(word 2,${SYSTEM_FILES.python33})
export PYTHON33_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python33}))

endif # PYTHON33_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
