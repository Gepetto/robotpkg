# $LAAS: perl.mk 2008/10/23 18:47:46 mallet $
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
#                                      Anthony Mallet on Thu Oct 23 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PERL_DEPEND_MK:=	${PERL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		perl
endif

ifeq (+,$(PERL_DEPEND_MK)) # -----------------------------------------

PREFER.perl?=		system

DEPEND_USE+=		perl

DEPEND_ABI.perl?=	perl>=5

SYSTEM_SEARCH.perl=	\
	'bin/perl:/v[0-9]/s/[^.0-9]*\\([.0-9]*\\).*/\\1/gp:% -v'

endif # PERL_DEPEND_MK -----------------------------------------------
