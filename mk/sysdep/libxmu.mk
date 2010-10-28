#
# Copyright (c) 2009 LAAS/CNRS
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
#                                    Xavier Broquere on Thu 28 Oct 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBXMU_DEPEND_MK:=	${LIBXMU_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libXmu
endif

ifeq (+,$(LIBXMU_DEPEND_MK)) # ---------------------------------------------

PREFER.libXmu?=		system
DEPEND_USE+=		libXmu
DEPEND_ABI.libXmu?=	libXmu>=1.0.5

SYSTEM_SEARCH.libXmu=	\
	include/X11/Xmu/Xmu.h \
	lib/libXmu.so

SYSTEM_PKG.Linux-fedora.libXmu=libXmu-devel
SYSTEM_PKG.Linux-ubuntu.libXmu=libXmu-dev
SYSTEM_PKG.Linux-debian.libXmu=libXmu-dev

endif # LIBXMU_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
