# $LAAS: depend.mk 2009/03/09 17:57:07 mallet $
#
# Copyright (c) 2008-2009 LAAS/CNRS
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
JRL_MODELLOADER_DEPEND_MK:=${JRL_MODELLOADER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jrl-modelloader
endif

ifeq (+,$(JRL_MODELLOADER_DEPEND_MK)) # ------------------------------

PREFER.jrl-modelloader?=robotpkg

DEPEND_USE+=		jrl-modelloader

DEPEND_ABI.jrl-modelloader?=jrl-modelloader>=1.4
DEPEND_DIR.jrl-modelloader?=../../devel/jrl-modelloader

SYSTEM_SEARCH.jrl-modelloader=\
	bin/ModelLoaderJRL		\
	'lib/pkgconfig/jrl-modelloader.pc:/Version/s/[^0-9.]//gp'

endif # JRL_MODELLOADER_DEPEND_MK ------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
