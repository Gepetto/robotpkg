#
#
# Copyright (c) 2009 LAAS/CNRS
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
#                                       Florent Lamiraux 04/28/2009
#

DISTNAME=	roboptim-core-${VERSION}
PKGNAME=	roboptim-core-${VERSION}
VERSION=	0.1.2

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=roboptim/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}roboptim/core

MAINTAINER=	roboptim-user@lists.sourceforge.net
#HOMEPAGE=	
COMMENT=	Optimization for robotics: common API to various solvers.

DOXYGEN_PLIST_DIR+=	share/doc/roboptim-core

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-boost=${PREFIX.boost-headers}

# --------------------------------------------------------------------

include ../../pkgtools/pkg-config/depend.mk
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/latex.mk
include ../../mk/robotpkg.mk
