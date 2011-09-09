# $LAAS: gtk.mk 2010/07/16 16:42:34 mallet $
#
# Copyright (c) 2008,2010 LAAS/CNRS
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

SYSTEM_PKG.Linux-fedore.gtk=	gtk2-devel
SYSTEM_PKG.Ubuntu.gtk=	libgtk2.0-dev
SYSTEM_PKG.Debian.gtk=	libgtk2.0-dev
SYSTEM_PKG.NetBSD.gtk=		x11/gtk2

endif # GTK_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
