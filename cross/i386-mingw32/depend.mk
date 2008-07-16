# $LAAS: depend.mk 2008/07/15 16:44:47 mallet $
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
#                                      Anthony Mallet on Tue Jul 15 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
I386_MINGW32_DEPEND_MK:=${I386_MINGW32_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		cross-i386-mingw32
endif

ifeq (+,$(I386_MINGW32_DEPEND_MK)) # ---------------------------------
PREFER.cross-i386-mingw32?=	robotpkg

DEPEND_USE+=			cross-i386-mingw32
DEPEND_METHOD.cross-i386-mingw32+=	build

DEPEND_ABI.cross-i386-mingw32?=	cross-i386-mingw32>=3.14
DEPEND_DIR.cross-i386-mingw32?=	../../cross/i386-mingw32

MINGW_SUBPREFIX=	i386-mingw32
MINGW_PREFIX=		${LOCALBASE}/${MINGW_SUBPREFIX}
PREFIX?=		${MINGW_PREFIX}

CC=	${LOCALBASE}/cross/bin/i386-mingw32-gcc
CXX=	${LOCALBASE}/cross/bin/i386-mingw32-g++

ifdef GNU_CONFIGURE
  CONFIGURE_ARGS+=	--host=i386-mingw32
endif # GNU_CONFIGURE

endif # I386_MINGW32_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

