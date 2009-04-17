# $LAAS: Makefile 2009/01/08 15:51:35 mallet $
#
# Copyright (c) 2007-2009 LAAS/CNRS
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
#                                       Anthony Mallet on Fri Jul 13 2007
#

DISTNAME=	kwsplus-${VERSION}
PKGNAME=	hpp-kwsplus-${VERSION}
VERSION=	1.7

CATEGORIES=	devel
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}kwsPlus
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=kwsplus/}

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Helper functions for KineoWorks(tm) package.

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-lapack=${PREFIX.lapack}

DOXYGEN_PLIST_DIR+=	share/doc/kwsPlus

# Options
PKG_SUPPORTED_OPTIONS+=	verbose1
PKG_OPTION_DESCR.verbose1=	Define level of verbosity
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

include ../../path/kineo-pp/depend.mk
include ../../math/lapack/depend.mk
include ../../devel/hpp-kwsio/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/latex.mk
include ../../mk/robotpkg.mk
