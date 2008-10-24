# $LAAS: flex.mk 2008/10/24 14:16:40 mallet $
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
#                                      Anthony Mallet on Fri Oct 24 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FLEX_DEPEND_MK:=	${FLEX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		flex
endif

ifeq (+,$(FLEX_DEPEND_MK)) # -----------------------------------------

LEX?=			flex
CONFIGURE_ENV+=		LEX=$(call quote,${LEX})

PREFER.flex?=		system
DEPEND_USE+=		flex
DEPEND_ABI.flex?=	flex>=2.5
DEPEND_METHOD.flex+=	build
SYSTEM_SEARCH.flex=	'bin/${LEX}:s/[^.0-9]*//p:% -V'

# flex/lex selection
PKG_SUPPORTED_OPTIONS+=	lex
PKG_OPTION_DESCR.lex=	Use lex in place of flex
PKG_OPTION_SET.lex=	LEX:=	lex
PKG_OPTION_UNSET.lex=	LEX:=	flex

endif # FLEX_DEPEND_MK -----------------------------------------------
