# $LAAS: Makefile 2009/02/27 17:59:35 mallet $
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
#                                       Anthony Mallet on Mon May 14 2007
#

DISTNAME=	dynamicsjrljapan-${VERSION}
PKGNAME=	jrl-dynamics-${VERSION}
VERSION=	1.11

CATEGORIES=	math
NO_PUBLIC_SRC=	yes
MASTER_SITES=		${MASTER_SITE_JRL}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}dynamics-JRLJapan

MAINTAINER=	openrobots@laas.fr
COMMENT=	JRL-Japan implementation of dynamic robot.

DOXYGEN_PLIST_DIR+=	share/doc/dynamicsJRLJapan

include ../../interfaces/jrl-mal/depend.mk
include ../../interfaces/jrl-interface-dynamics/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
