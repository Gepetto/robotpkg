# $LAAS: Makefile 2009/02/10 17:10:20 tho $
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
#                                       Anthony Mallet on Fri Jun 15 2007
#

DISTNAME=	abstractgiktask-${VERSION}
PKGNAME=	jrl-interface-giktask-${VERSION}
VERSION=	1.4

CATEGORIES=	interfaces
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}jrlCIR-giktask

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	JRL abstract interface for generalized inverse kinematics tasks.

DEPENDS+=	jrl-interface-dynamics>=1.8:../../interfaces/jrl-interface-dynamics

GNU_CONFIGURE=	yes

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
