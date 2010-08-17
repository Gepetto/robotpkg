# robotpkg depend.mk for:	devel/omniORBpy
# Created:			Anthony Mallet on Thu, 13 Mar 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OMNIORBPY_DEPEND_MK:=	${OMNIORBPY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		omniORBpy
endif

ifeq (+,$(OMNIORBPY_DEPEND_MK))
PREFER.omniORBpy?=	robotpkg

DEPEND_USE+=		omniORBpy

DEPEND_ABI.omniORBpy?=	omniORBpy>=3.1
DEPEND_DIR.omniORBpy?=	../../devel/omniORBpy

SYSTEM_SEARCH.omniORBpy=\
	include/omniORBpy.h
endif

include ../../devel/omniORB/depend.mk

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
