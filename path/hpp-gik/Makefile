# $LAAS: Makefile 2009/12/01 11:05:30 mallet $
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

DISTNAME=	hpp-gik-${VERSION}
PKGNAME=	hpp-gik-${VERSION}
VERSION=	2.6.2

CATEGORIES=	path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=hpp-gik/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}algo/hpp-gik

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Generalized Inverse Kinematics for humanoid robots.

GNU_CONFIGURE=		yes
USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/hpp-gik

include ../../interfaces/jrl-interface-giktask/depend.mk
include ../../math/jrl-dynamics/depend.mk
include ../../math/hrp2-dynamics/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
