# $LAAS: Makefile 2009/02/10 17:13:08 tho $
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
#                                       Anthony Mallet on Tue Jun 28 2007
#

DISTNAME=	hppgik-${VERSION}
PKGNAME=	hpp-gik-${VERSION}
VERSION=	2.2

CATEGORIES=	path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=hppgik/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}hppGik

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Generalized Inverse Kinematics for humanoid robots.

DEPENDS+=	jrl-interface-giktask>=2.0:../../interfaces/jrl-interface-giktask

GNU_CONFIGURE=	yes

include ../../math/jrl-dynamics/depend.mk
include ../../math/hrp2-dynamics/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
