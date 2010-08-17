# robotpkg depend.mk for:	devel/boost-build
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BOOST_BUILD_DEPEND_MK:=	${BOOST_BUILD_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		boost-build
endif

ifeq (+,$(BOOST_BUILD_DEPEND_MK)) # ----------------------------------

PREFER.boost?=		system
PREFER.boost-build?=	${PREFER.boost}

SYSTEM_SEARCH.boost-build=\
	share/boost-build/boost-build.jam	\
	share/boost-build/bootstrap.jam

DEPEND_USE+=			boost-build

DEPEND_ABI.boost-build?=	boost-build>=1.34.1
DEPEND_DIR.boost-build?=	../../devel/boost-build

DEPEND_METHOD.boost-build?=	build

endif # BOOST_BUILD_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
