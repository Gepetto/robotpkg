# $LAAS: depend.mk 2008/05/25 15:46:14 tho $
#
# Copyright (c) 2008 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice  and this list of  conditions in the documentation   and/or
#      other materials provided with the distribution.
#
#                                      Arnaud Degroote on Tue May 20 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SERIAL_DEPEND_MK:=${SERIAL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		serial
endif

ifeq (+,$(SERIAL_DEPEND_MK))
PREFER.serial?=	robotpkg

DEPEND_USE+=		serial

DEPEND_ABI.serial?=	serial>=1.0.1
DEPEND_DIR.serial?=	../../robots/serial

SYSTEM_SEARCH.serial=\
	include/serial/serial.h \
	lib/pkgconfig/serial.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
