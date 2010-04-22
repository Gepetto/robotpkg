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
ROBOTIS_OROYARP_DEPEND_MK:=		${ROBOTIS_OROYARP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		robotis-oroyarp
endif

ifeq (+,$(ROBOTIS_OROYARP_DEPEND_MK)) # ------------------------------------------

PREFER.robotis-oroyarp?=		robotpkg

DEPEND_USE+=		robotis-oroyarp

DEPEND_ABI.robotis-oroyarp?=	robotis-oroyarp>=1.2
DEPEND_DIR.robotis-oroyarp?=	../../architecture/robotis-oroyarp

SYSTEM_SEARCH.robotis-oroyarp=\
	bin/deployer-yarp							\
	include/robotis/oroyarp/Orocos2Yarp.h		\
	lib/librobotis-oroyarp.so

endif # ROBOTIS_OROYARP_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

