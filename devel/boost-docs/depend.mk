# robotpkg depend.mk for:	devel/boost-docs
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BOOST_DOCS_DEPEND_MK:=	${BOOST_DOCS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		boost-docs
endif

ifeq (+,$(BOOST_DOCS_DEPEND_MK)) # -----------------------------------

PREFER.boost?=		system
PREFER.boost-docs?=	${PREFER.boost}

SYSTEM_SEARCH.boost-docs=\
	share/doc/boost/boost.css	\
	share/doc/boost/index.htm

DEPEND_USE+=		boost-docs

DEPEND_ABI.boost-docs?=	boost-docs>=1.34.1
DEPEND_DIR.boost-docs?=	../../devel/boost-docs

DEPEND_METHOD.boost-docs?=	build

endif # BOOST_DOCS_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
