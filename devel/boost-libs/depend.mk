#
# Copyright (c) 2008-2009 LAAS/CNRS
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
BOOST_LIBS_DEPEND_MK:=	${BOOST_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		boost-libs
endif

ifeq (+,$(BOOST_LIBS_DEPEND_MK)) # -----------------------------------

PREFER.boost?=		system
PREFER.boost-libs?=	${PREFER.boost}

SYSTEM_PKG.Linux-fedora.boost-libs=	boost-devel
SYSTEM_PKG.Linux-ubuntu.boost-libs=	libboost-dev
SYSTEM_PKG.NetBSD.boost-libs=		pkgsrc/devel/boost-libs

SYSTEM_SEARCH.boost-libs=\
	'lib/libboost_thread{,-mt}.*'	\
	'lib/libboost_iostreams{,-mt}.*'

DEPEND_USE+=		boost-libs

DEPEND_ABI.boost-libs?=	boost-libs>=1.34.1
DEPEND_DIR.boost-libs?=	../../devel/boost-libs

DEPEND_METHOD.boost-libs?=	build

endif # BOOST_LIBS_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
