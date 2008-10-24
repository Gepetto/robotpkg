# $LAAS: Makefile 2008/10/24 12:04:30 mallet $
#
# Copyright (c) 2007-2008 LAAS/CNRS
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
#                                       Anthony Mallet on Sun Jan 28 2007
#

DISTNAME=	genom-2.0
PKGREVISION=	4
CATEGORIES=	architecture
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	https://softs.laas.fr/openrobots/wiki/genom
COMMENT=	Software components generator for robotics architecture.

GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	PERL=${PREFIX.perl}/bin/perl

# "tcl" option
PKG_SUPPORTED_OPTIONS+=	tcl
PKG_SUGGESTED_OPTIONS+=	tcl

PKG_OPTION_DESCR.tcl=	Enable support for TCL clients
define PKG_OPTION_SET.tcl
  CONFIGURE_ARGS+=	--with-tcl=${PREFIX.tcl}/lib
  include ../../mk/sysdep/tcl.mk
endef
define PKG_OPTION_UNSET.tcl
  CONFIGURE_ARGS+=	--without-tcl
endef

include ../../devel/pocolibs/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/sysdep/perl.mk
include ../../mk/robotpkg.mk
