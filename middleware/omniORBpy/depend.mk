# robotpkg depend.mk for:	middleware/omniORBpy
# Created:			Anthony Mallet on Thu, 13 Mar 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OMNIORBPY_DEPEND_MK:=	${OMNIORBPY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		omniORBpy
endif

ifeq (+,$(OMNIORBPY_DEPEND_MK)) # ------------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 10.04,${OS_VERSION}))
    PREFER.omniORBpy?=	robotpkg
  endif
else ifeq (Fedora,${OPSYS})
  ifneq (,$(filter 18 19,${OS_VERSION}))
    PREFER.omniORBpy?=	robotpkg
  endif
else ifeq (Gentoo,${OS_FAMILY})
  PREFER.omniORBpy?=	robotpkg
endif
PREFER.omniORBpy?=	system

DEPEND_USE+=		omniORBpy

DEPEND_ABI.omniORBpy?=	omniORBpy>=3.1
DEPEND_DIR.omniORBpy?=	../../middleware/omniORBpy

SYSTEM_SEARCH.omniORBpy=\
  '${PYTHON_SYSLIBSEARCH}/omniORB/__init__.py'

SYSTEM_PKG.Debian.omniORBpy =	python-omniorb
SYSTEM_PKG.Fedora.omniORBpy =	omniORB-devel
SYSTEM_PKG.NetBSD.omniORBpy =	net/omniORB

include ../../mk/sysdep/python.mk

endif # OMNIORBPY_DEPEND_MK ------------------------------------------------

include ../../middleware/omniORB/depend.mk

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
