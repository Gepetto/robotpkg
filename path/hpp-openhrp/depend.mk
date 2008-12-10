# $LAAS: depend.mk 2008/12/09 16:25:00 mallet $
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
#                                       Anthony Mallet on Tue Dec  9 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_OPENHRP_DEPEND_MK:=	${HPP_OPENHRP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-openhrp
endif

ifeq (+,$(HPP_OPENHRP_DEPEND_MK)) # ----------------------------------

PREFER.hpp-openhrp?=	robotpkg

DEPEND_USE+=		hpp-openhrp

DEPEND_ABI.hpp-openhrp?=hpp-openhrp>=1.3
DEPEND_DIR.hpp-openhrp?=../../path/hpp-openhrp

SYSTEM_SEARCH.hpp-openhrp=\
	include/hppOpenHRP/parserOpenHRPKineo.h		\
	'lib/pkgconfig/hppOpenHRP.pc:/Version:/s/[^0-9.]*//p'

endif # HPP_OPENHRP_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
