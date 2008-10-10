# $LAAS: depend.mk 2008/10/10 14:15:47 mallet $
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
#                                       Anthony Mallet on Mon Oct  6 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BOOST_DEPEND_MK:=	${BOOST_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		boost
endif

ifeq (+,$(BOOST_DEPEND_MK)) # ----------------------------------------

PREFER.boost?=		robotpkg

DEPEND_USE+=		boost

DEPEND_ABI.boost?=	boost>=1.34.1
DEPEND_DIR.boost?=	../../devel/boost

endif # BOOST_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
