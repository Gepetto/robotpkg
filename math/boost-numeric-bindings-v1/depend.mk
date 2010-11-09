# robotpkg depend.mk for:	math/boost-numeric-bindings-v1
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BOOST_NUMERIC_BINDINGS_V1_DEPEND_MK:=${BOOST_NUMERIC_BINDINGS_V1_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		boost-numeric-bindings-v1
endif

ifeq (+,$(BOOST_NUMERIC_BINDINGS_V1_DEPEND_MK)) # --------------------------

PREFER.boost-numeric-bindings-v1?=		robotpkg

SYSTEM_SEARCH.boost-numeric-bindings-v1=\
	include/boost/numeric/bindings/lapack/lapack.h	\
	include/boost/numeric/bindings/blas/blas.h

DEPEND_USE+=				boost-numeric-bindings-v1

DEPEND_ABI.boost-numeric-bindings-v1?=	boost-numeric-bindings-v1>=20090215
DEPEND_DIR.boost-numeric-bindings-v1?=	../../math/boost-numeric-bindings-v1

DEPEND_METHOD.boost-numeric-bindings-v1?=	build

include ../../devel/boost-headers/depend.mk

endif # BOOST_NUMERIC_BINDINGS_V1_DEPEND_MK --------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
