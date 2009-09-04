# $LAAS: Makefile 2008/11/02 15:52:50 tho $
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

DISTNAME=	genom-2.4
CATEGORIES=	architecture
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=genom/}
MASTER_REPOSITORY= git ssh://trac.laas.fr/git/robots/genom

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	https://softs.laas.fr/openrobots/wiki/genom
COMMENT=	Software components generator for robotics architecture.

GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	PERL=${PREFIX.perl}/bin/perl

# genom must be able to compile c++ modules, and it checks for a c++
# compiler
USE_LANGUAGES+=	c++

# --- "tcl" option ---------------------------------------------------

PKG_SUPPORTED_OPTIONS+=	tcl
PKG_SUGGESTED_OPTIONS+=	tcl

PKG_OPTION_DESCR.tcl=	Enable support for TCL clients
define PKG_OPTION_SET.tcl
  CONFIGURE_ARGS+=	--with-tcl=$(dir ${TCL_CONFIG_SH})
  include ../../mk/sysdep/tcl.mk
endef
define PKG_OPTION_UNSET.tcl
  CONFIGURE_ARGS+=	--without-tcl
endef

# --- "doc" option ---------------------------------------------------

PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc

PKG_OPTION_DESCR.doc=	Compile documentation material
define PKG_OPTION_SET.doc
  CONFIGURE_ENV+=	LATEX=${PDFLATEX}
  include ../../mk/sysdep/pdflatex.mk
endef
define PKG_OPTION_UNSET.doc
  CONFIGURE_ENV+=	LATEX=:
endef

include ../../devel/pocolibs/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/sysdep/perl.mk
include ../../mk/sysdep/flex.mk
include ../../mk/sysdep/bison.mk
include ../../mk/robotpkg.mk
