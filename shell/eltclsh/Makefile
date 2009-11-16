# $LAAS: Makefile 2009/11/16 00:10:29 tho $
#
# Copyright (c) 2007-2009 LAAS/CNRS
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
#                                      Anthony Mallet on Tue Mar 13 2007
#

DISTNAME=		eltclsh-1.10
CATEGORIES=		shell
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}eltclsh

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		https://softs.laas.fr/openrobots/wiki/eltclsh
COMMENT=		Interactive shell for the TCL programming language.

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-tcl=$(dir ${TCL_CONFIG_SH})
CONFIGURE_ARGS+=	--with-tk=$(dir ${TK_CONFIG_SH})

CONFIGURE_LOG_ETA=	115
BUILD_LOG_ETA=		30
INSTALL_LOG_ETA=	15

include ../../devel/libedit/depend.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/tk.mk
include ../../mk/robotpkg.mk
