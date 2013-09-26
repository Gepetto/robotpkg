# robotpkg sysdep/python26.mk
# Created:			Anthony Mallet on Wed, 13 Jul 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON26_DEPEND_MK:=	${PYTHON26_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python26
endif

ifeq (+,$(PYTHON26_DEPEND_MK)) # -------------------------------------------

DEPEND_USE+=		python26

include ../../mk/sysdep/python.mk
PREFER.python26?=	${PREFER.python}

DEPEND_ABI.python26?=	python26>=2.6<2.7

# see sysdep/python.mk for the definition of SYSTEM_SEARCH.python
_py_search26=		{2.6,2,}
SYSTEM_SEARCH.python26=	$(call _py_syssearch,${_py_search26})

SYSTEM_PKG.Fedora.python26=	python2.6-devel
SYSTEM_PKG.Debian.python26=	python2.6-dev
SYSTEM_PKG.NetBSD.python26=	lang/python26
SYSTEM_PKG.Gentoo.python26=	'=dev-lang/python-2.6*'

export PYTHON26=	$(firstword ${SYSTEM_FILES.python26})
export PYTHON26_LIB=	$(word 2,${SYSTEM_FILES.python26})
export PYTHON26_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python26}))

endif # PYTHON26_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
