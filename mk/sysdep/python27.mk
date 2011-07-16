# robotpkg sysdep/python27.mk
# Created:			Anthony Mallet on Wed, 13 Jul 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON27_DEPEND_MK:=	${PYTHON27_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python27
endif

ifeq (+,$(PYTHON27_DEPEND_MK)) # -------------------------------------------

DEPEND_USE+=		python27

include ../../mk/sysdep/python.mk
PREFER.python27?=	${PREFER.python}

DEPEND_ABI.python27?=	python27>=2.7<2.8

# see sysdep/python.mk for the definition of SYSTEM_SEARCH.python
_py_search27=		{2.7,2,}
SYSTEM_SEARCH.python27=	$(call _py_syssearch,${_py_search27})

SYSTEM_PKG.Linux-fedora.python27=	python2.7-devel
SYSTEM_PKG.Linux-ubuntu.python27=	python2.7-dev
SYSTEM_PKG.Linux-debian.python27=	python2.7-dev
SYSTEM_PKG.NetBSD.python27=		pkgsrc/lang/python27

export PYTHON27=	$(firstword ${SYSTEM_FILES.python27})
export PYTHON27_LIB=	$(word 2,${SYSTEM_FILES.python27})
export PYTHON27_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python27}))

endif # PYTHON27_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
