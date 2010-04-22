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
OROCOS_OCL_DEPEND_MK:=		${OROCOS_OCL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		orocos-ocl
endif

ifeq (+,$(OROCOS_OCL_DEPEND_MK)) # ------------------------------------------

PREFER.orocos-ocl?=		robotpkg

DEPEND_USE+=		orocos-ocl

DEPEND_ABI.orocos-ocl?=	orocos-ocl>=1.10
DEPEND_DIR.orocos-ocl?=	../../architecture/orocos-ocl

SYSTEM_SEARCH.orocos-ocl=\
	include/ocl/OCL.hpp						\
	lib/liborocos-deployment-gnulinux.so	\
	lib/pkgconfig/orocos-ocl-gnulinux.pc

endif # OROCOS_OCL_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

