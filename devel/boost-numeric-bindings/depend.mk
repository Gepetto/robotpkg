# $LAAS: depend.mk 2008/10/10 15:17:32 mallet $
#
# Copyright (c) 2008 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
#                                      Anthony Mallet on Fri Oct 10 2008
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

DEPEND_ABI.boost-numeric-bindings?=	boost-numeric-bindings>=20070129r1
DEPEND_DIR.boost-numeric-bindings?=	../../devel/boost-numeric-bindings

DEPEND_METHOD.boost-numeric-bindings?=	build

endif # BOOST_NUMERIC_BINDINGS_DEPEND_MK -----------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
