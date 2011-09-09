# robotpkg sysdep/python25.mk
# Created:			Anthony Mallet on Wed, 13 Jul 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON25_DEPEND_MK:=	${PYTHON25_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python25
endif

ifeq (+,$(PYTHON25_DEPEND_MK)) # -------------------------------------------

DEPEND_USE+=		python25

include ../../mk/sysdep/python.mk
PREFER.python25?=	${PREFER.python}

DEPEND_ABI.python25?=	python25>=2.5<2.6

# see sysdep/python.mk for the definition of SYSTEM_SEARCH.python
_py_search25=		{2.5,2,}
SYSTEM_SEARCH.python25=	$(call _py_syssearch,${_py_search25})

SYSTEM_PKG.Fedora.python25=	python2.5-devel
SYSTEM_PKG.Ubuntu.python25=	python2.5-dev
SYSTEM_PKG.Debian.python25=	python2.5-dev
SYSTEM_PKG.NetBSD.python25=		pkgsrc/lang/python25

export PYTHON25=	$(firstword ${SYSTEM_FILES.python25})
export PYTHON25_LIB=	$(word 2,${SYSTEM_FILES.python25})
export PYTHON25_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python25}))

endif # PYTHON25_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
