# robotpkg depend.mk for:	devel/boost-numeric-bindings
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BOOST_NUMERIC_BINDINGS_DEPEND_MK:=${BOOST_NUMERIC_BINDINGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		boost-numeric-bindings
endif

ifeq (+,$(BOOST_NUMERIC_BINDINGS_DEPEND_MK)) # -----------------------

PREFER.boost-numeric-bindings?=		robotpkg

SYSTEM_SEARCH.boost-numeric-bindings=\
	include/boost/numeric/bindings/lapack/lapack.h	\
	include/boost/numeric/bindings/blas/blas.h

DEPEND_USE+=				boost-numeric-bindings

DEPEND_ABI.boost-numeric-bindings?=	boost-numeric-bindings>=20090215
DEPEND_DIR.boost-numeric-bindings?=	../../devel/boost-numeric-bindings

DEPEND_METHOD.boost-numeric-bindings?=	build

include ../../devel/boost-headers/depend.mk

endif # BOOST_NUMERIC_BINDINGS_DEPEND_MK -----------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
