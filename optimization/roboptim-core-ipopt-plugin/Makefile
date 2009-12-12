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

DISTNAME=	roboptim-core-ipopt-plugin-${VERSION}
PKGNAME=	roboptim-core-ipopt-plugin-${VERSION}
VERSION=	0.2

CATEGORIES=	optimization
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=roboptim/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}roboptim/core

MAINTAINER=	roboptim-user@lists.sourceforge.net
HOMEPAGE=	http://sourceforge.net/projects/roboptim/
COMMENT=	plug-in linking ipopt to roboptim-core

USE_LANGUAGES+= c c++

DOXYGEN_PLIST_DIR+=	share/doc/roboptim-core-ipopt-plugin

GNU_CONFIGURE=	yes

# --------------------------------------------------------------------

include ../../optimization/roboptim-core/depend.mk
include ../../optimization/ipopt/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/latex.mk
include ../../mk/robotpkg.mk
