# $LAAS: depend.mk 2008/11/28 15:58:54 mallet $
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
