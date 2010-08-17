# robotpkg depend.mk for:	devel/boost
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BOOST_DEPEND_MK:=	${BOOST_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		boost
endif

ifeq (+,$(BOOST_DEPEND_MK)) # ----------------------------------------

PREFER.boost?=		system

DEPEND_USE+=		boost

DEPEND_ABI.boost?=	boost>=1.34.1
DEPEND_DIR.boost?=	../../devel/boost

endif # BOOST_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
