# $LAAS: gtk.mk 2008/12/13 15:37:33 tho $
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
#                                      Anthony Mallet on Sat Dec 13 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GTK_DEPEND_MK:=		${GTK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gtk
endif

ifeq (+,$(GTK_DEPEND_MK)) # ------------------------------------------------

PREFER.gtk?=		system
DEPEND_USE+=		gtk
DEPEND_ABI.gtk?=	gtk>=2.8.17

SYSTEM_SEARCH.gtk=	\
	'include/gtk-2.0/gtk/gtk.h'				\
	'lib/pkgconfig/gtk+-2.0.pc:/Version/s/[^.0-9]//gp'

endif # GTK_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
