# robotpkg depend.mk for:	devel/omniORB
# Created:			Anthony Mallet on Thu, 13 Mar 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OMNIORB_DEPEND_MK:=	${OMNIORB_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		omniORB
endif

ifeq (+,$(OMNIORB_DEPEND_MK))
PREFER.omniORB?=	robotpkg

DEPEND_USE+=		omniORB

DEPEND_ABI.omniORB?=	omniORB>=4.1.1
DEPEND_DIR.omniORB?=	../../devel/omniORB

SYSTEM_SEARCH.omniORB=	\
	bin/omniidl			\
	lib/pkgconfig/omniORB4.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
