# robotpkg depend.mk for:	lang/python35
# Created:			Anthony Mallet on Wed, 18 May 2016
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON35_DEPEND_MK:=	${PYTHON35_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python35
endif

ifeq (+,$(PYTHON35_DEPEND_MK)) # -------------------------------------------

DEPEND_USE+=		python35

include ../../mk/sysdep/python.mk
PREFER.python35?=	system

DEPEND_ABI.python35?=	python35>=3.5<3.6

# see sysdep/python.mk for the definition of SYSTEM_SEARCH.python
_py_search35=		{3.5,3,}{,d}{,m}{,u}
SYSTEM_SEARCH.python35=	$(call _py_syssearch,${_py_search35})

SYSTEM_PKG.Fedora.python35=	python3.5-devel
SYSTEM_PKG.Debian.python35=	python3-dev
SYSTEM_PKG.NetBSD.python35=	lang/python35
SYSTEM_PKG.Gentoo.python35=	'=dev-lang/python-3.5*'

# directory for byte compiled files
PYTHON35_TAG=		.cpython-35
PYTHON35_PYCACHE=	__pycache__

export PYTHON35=	$(firstword ${SYSTEM_FILES.python35})
export PYTHON35_LIB=	$(word 2,${SYSTEM_FILES.python35})
export PYTHON35_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python35}))

endif # PYTHON35_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
