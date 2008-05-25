# $LAAS: Makefile 2008/05/25 14:32:20 tho $
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
#                                       Anthony Mallet on Mon Feb 18 2008
#

DISTNAME=	hrp2dynamics-${VERSION}
PKGNAME=	hrp2-dynamics-${VERSION}
VERSION=	1.0

CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_JRL}
NO_PUBLIC_SRC=	yes

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Optimized implementation of functions related to HRP-2 dynamics.

DEPENDS+=	jrl-dynamics>=1.7:../../math/jrl-dynamics

GNU_CONFIGURE=	yes

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
