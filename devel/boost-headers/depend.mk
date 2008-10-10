# $LAAS: depend.mk 2008/10/10 13:43:59 mallet $
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
BOOST_HEADERS_DEPEND_MK:=${BOOST_HEADERS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		boost-headers
endif

ifeq (+,$(BOOST_HEADERS_DEPEND_MK)) # --------------------------------

PREFER.boost-headers?=	robotpkg

SYSTEM_SEARCH.boost-headers=\
	include/boost/config.hpp	\
	include/boost/config/user.hpp

DEPEND_USE+=			boost-headers

DEPEND_ABI.boost-headers?=	boost-headers>=1.34.1
DEPEND_DIR.boost-headers?=	../../devel/boost-headers

DEPEND_METHOD.boost-headers?=	build

endif # BOOST_HEADERS_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
