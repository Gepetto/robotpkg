# $LAAS: Makefile 2009/02/10 17:13:47 tho $
#
# Copyright (c) 2008-2009 LAAS/CNRS
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
#                                       Florent Lamiraux on Oct 14 2009
#

DISTNAME=	fsqp-${VERSION}
PKGNAME=	fsqp-${VERSION}
VERSION=	2.5d

CATEGORIES=	math
NO_PUBLIC_SRC=	yes
MASTER_SITES=		${MASTER_SITE_JRL}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}fsqp

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Feasible Sequential Quadratic Programming

GNU_CONFIGURE=		yes
DOXYGEN_PLIST_DIR+=	share/doc/fsqp

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
