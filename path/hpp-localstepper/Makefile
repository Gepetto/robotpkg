# $LAAS: Makefile 2009/02/27 18:09:51 mallet $
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

DISTNAME=	hpp-localstepper-${VERSION}
PKGNAME=	hpp-localstepper-${VERSION}
VERSION=	1.1.1

CATEGORIES=	path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=hpp-localstepper/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}algo/hpp-localstepper

MAINTAINER=	hpp@laas.fr
COMMENT=	Whole-body motion planning for humanoid robot with steps

USE_LANGUAGES+= c c++

GNU_CONFIGURE=		yes
DOXYGEN_PLIST_DIR+=	share/doc/hpp-localstepper

include ../../path/hpp-hik/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
