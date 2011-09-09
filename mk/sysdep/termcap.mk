# $LAAS: termcap.mk 2009/09/23 18:57:00 mallet $
#
# Copyright (c) 2008-2009 LAAS/CNRS
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
#                                      Anthony Mallet on Sat Nov  1 2008
#

# This Makefile fragment is meant to be included by packages that require
# a termcap implementation that supports the basic termcap functions:
#
#	tgetent, tgetstr, tgetflag, tgetnum, tgoto, tputs
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TERMCAP_DEPEND_MK:=	${TERMCAP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		termcap
endif

ifeq (+,$(TERMCAP_DEPEND_MK)) # --------------------------------------

PREFER.termcap?=	system

DEPEND_USE+=		termcap
DEPEND_ABI.termcap?=	termcap

SYSTEM_DESCR.termcap=	"curses, ncurses, termlib or termcap"

SYSTEM_PKG.Fedora.termcap=	"ncurses-devel"
SYSTEM_PKG.Ubuntu.termcap=	"libncurses-dev"
SYSTEM_PKG.Debian.termcap=	"libncurses-dev"
SYSTEM_PKG.NetBSD.termcap=		"pkgsrc/devel/ncurses"

SYSTEM_SEARCH.termcap=\
	'include/{term,termcap,termlib}.h'		\
	'lib/lib{tinfo,curses,termcap,termlib}.*'


endif # TERMCAP_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
