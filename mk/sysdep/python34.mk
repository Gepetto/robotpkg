# robotpkg depend.mk for:	lang/python34
# Created:			Anthony Mallet on Mon, 28 Apr 2014
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON34_DEPEND_MK:=	${PYTHON34_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python34
endif

ifeq (+,$(PYTHON34_DEPEND_MK)) # -------------------------------------------

DEPEND_USE+=		python34

include ../../mk/sysdep/python.mk
PREFER.python34?=	system

DEPEND_ABI.python34?=	python34>=3.4<3.5

# see sysdep/python.mk for the definition of SYSTEM_SEARCH.python
_py_search34=		{3.4,3,}{,d}{,m}{,u}
SYSTEM_SEARCH.python34=	$(call _py_syssearch,${_py_search34})

SYSTEM_PKG.Fedora.python34=	python3.4-devel
SYSTEM_PKG.Debian.python34=	python3-dev
SYSTEM_PKG.NetBSD.python34=	lang/python34
SYSTEM_PKG.Gentoo.python34=	'=dev-lang/python-3.4*'

# directory for byte compiled files
PYTHON34_TAG=		.cpython-34
PYTHON34_PYCACHE=	__pycache__

export PYTHON34=	$(firstword ${SYSTEM_FILES.python34})
export PYTHON34_LIB=	$(word 2,${SYSTEM_FILES.python34})
export PYTHON34_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python34}))

endif # PYTHON34_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
