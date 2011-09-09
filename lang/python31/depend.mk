# robotpkg depend.mk for:	lang/python31
# Created:			Séverin Lemaignan on Mon, 7 Dec 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON31_DEPEND_MK:=	${PYTHON31_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python31
endif

ifeq (+,$(PYTHON31_DEPEND_MK)) # -------------------------------------------

DEPEND_USE+=		python31

include ../../mk/sysdep/python.mk
PREFER.python31?=	${PREFER.python}

DEPEND_ABI.python31?=	python31>=3.1<3.2
DEPEND_DIR.python31?=	../../lang/python31

# see sysdep/python.mk for the definition of SYSTEM_SEARCH.python
_py_search31=		{3.1,3,}{,d}{,m}{,u}
SYSTEM_SEARCH.python31=	$(call _py_syssearch,${_py_search31})

SYSTEM_PKG.Fedora.python31=	python3.1-devel
SYSTEM_PKG.Ubuntu.python31=	python3.1-dev
SYSTEM_PKG.Debian.python31=	python3.1-dev
SYSTEM_PKG.NetBSD.python31=		pkgsrc/lang/python31

export PYTHON31=	$(firstword ${SYSTEM_FILES.python31})
export PYTHON31_LIB=	$(word 2,${SYSTEM_FILES.python31})
export PYTHON31_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python31}))

endif # PYTHON31_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
