# $LAAS: Makefile 2008/05/25 15:46:00 tho $
#
# Copyright (c) 2008 LAAS/CNRS
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
#                                      Arnaud Degroote on Mon Jun 06 2008
#

DISTNAME=		hardlib-${VERSION}
PKGNAME=		sickLib-${VERSION}
VERSION=		1.0.1
CATEGORIES=		robot
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Driver and interface for sick interface

GNU_CONFIGURE=		yes

WRKSRC=			${WRKDIR}/hardlib-${VERSION}/sickLib

DEPENDS+=		mkdep>=2.6:../../devel/mkdep

include ../../devel/pocolibs/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../robots/serial/depend.mk
include ../../mk/robotpkg.mk
