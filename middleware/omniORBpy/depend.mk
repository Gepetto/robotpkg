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
endif
PREFER.omniORBpy?=	system

DEPEND_USE+=		omniORBpy

DEPEND_ABI.omniORBpy?=	omniORBpy>=3.1
DEPEND_DIR.omniORBpy?=	../../middleware/omniORBpy

SYSTEM_SEARCH.omniORBpy=\
	include/omniORBpy.h

SYSTEM_PKG.Debian.omniORBpy =	python-omniorb
SYSTEM_PKG.Fedora.omniORBpy =	omniORB-devel
SYSTEM_PKG.NetBSD.omniORBpy =	net/omniORB

endif # OMNIORBPY_DEPEND_MK ------------------------------------------------

include ../../middleware/omniORB/depend.mk

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
