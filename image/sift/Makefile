# $LAAS: Makefile 2010/04/27 23:11:00 tho $
#
# Copyright (c) 2007-2010 LAAS/CNRS
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
#                                        Nizar Sallem on Thu Jun 03 2010
#

PKGVERSION=		1.1.2
DISTNAME=		sift-${PKGVERSION}_20100521
PKGNAME=		sift-${PKGVERSION}
CATEGORIES=		image
MASTER_SITES=		http://web.engr.oregonstate.edu/~hess/downloads/sift/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://web.engr.oregonstate.edu/~hess
COMMENT=		GPL v2 implementation of David Lowe SIFT

WRKSRC=			${WRKDIR}/sift

USE_LANGUAGES+=		c c++
USE_PKGLOCALEDIR=	yes

NO_CONFIGURE=           yes

include ../../image/opencv/depend.mk
include ../../mk/sysdep/gtk.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
