# $LAAS: Makefile 2009/01/08 15:30:11 mallet $
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

DISTNAME=	kwsio-${VERSION}
PKGNAME=	hpp-kwsio-${VERSION}
VERSION=	1.0.1

CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Input and Output functions for KineoWorks(tm) package.

USE_LANGUAGES+=	c c++

GNU_CONFIGURE=		yes
DOXYGEN_PLIST_DIR+=	share/doc/kwsIO

include ../../path/kineo-pp/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/robotpkg.mk
