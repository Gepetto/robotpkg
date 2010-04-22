#
# Copyright (c) 2008,2010 LAAS/CNRS
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
#                                       Arnaud Degroote on Wed Apr 22 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OROCOS_RTT_DEPEND_MK:=		${OROCOS_RTT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		orocos-rtt
endif

ifeq (+,$(OROCOS_RTT_DEPEND_MK)) # ------------------------------------------

PREFER.orocos-rtt?=		robotpkg

DEPEND_USE+=		orocos-rtt

DEPEND_ABI.orocos-rtt?=	orocos-rtt>=1.10
DEPEND_DIR.orocos-rtt?=	../../architecture/orocos-rtt

SYSTEM_SEARCH.orocos-rtt=\
	include/rtt/RTT.hpp					\
	lib/liborocos-rtt-gnulinux.so		\
	lib/pkgconfig/orocos-rtt-gnulinux.pc 

endif # OROCOS_RTT_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

