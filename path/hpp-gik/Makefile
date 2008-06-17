# $LAAS: Makefile 2008/06/17 14:25:55 mallet $
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
#                                       Anthony Mallet on Tue Jun 28 2007
#

DISTNAME=	hppgik-${VERSION}
PKGNAME=	hpp-gik-${VERSION}
VERSION=	1.9

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hppgik/}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Generalized Inverse Kinematics for humanoid robots.

DEPENDS+=	jrl-interface-giktask>=1.4:../../interfaces/jrl-interface-giktask
DEPENDS+=	jrl-dynamics>=1.8:../../math/jrl-dynamics

GNU_CONFIGURE=	yes

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
