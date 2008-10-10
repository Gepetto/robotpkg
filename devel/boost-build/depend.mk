# $LAAS: depend.mk 2008/10/10 14:41:25 mallet $
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
BOOST_BUILD_DEPEND_MK:=	${BOOST_BUILD_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		boost-build
endif

ifeq (+,$(BOOST_BUILD_DEPEND_MK)) # ----------------------------------

PREFER.boost-build?=	robotpkg

SYSTEM_SEARCH.boost-build=\
	share/boost-build/boost-build.jam	\
	share/boost-build/bootstrap.jam

DEPEND_USE+=			boost-build

DEPEND_ABI.boost-build?=	boost-build>=1.34.1
DEPEND_DIR.boost-build?=	../../devel/boost-build

DEPEND_METHOD.boost-build?=	build

endif # BOOST_BUILD_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
