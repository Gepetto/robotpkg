# $LAAS: Makefile 2009/03/27 11:40:32 mallet $
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
#                                       Anthony Mallet on Tue May 15 2007
#

DISTNAME=	walkgenjrl-${VERSION}
PKGNAME=	jrl-walkgen-${VERSION}
VERSION=	2.5.4

CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_JRL}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/jrl/walkGenJrl

USE_LANGUAGES+=fortran

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://softs.laas.fr/jrl/spip/-Walk-Pattern-Generator-.html
COMMENT=	Walk pattern generator for the HRP-2 humanoid robot.

USE_LANGUAGES+=		c++ fortran
DOXYGEN_PLIST_DIR+=	share/doc/walkGenJrl

include ../../mk/sysdep/cmake.mk
include ../../math/jrl-dynamics/depend.mk
include ../../robot/hrpsys-jrl/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
