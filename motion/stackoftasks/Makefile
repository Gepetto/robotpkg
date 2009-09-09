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

DISTNAME=	stackoftasks-${VERSION}
PKGNAME=	stackoftasks-${VERSION}
VERSION=	1.1.0

CATEGORIES=	motion
NO_PUBLIC_SRC=	no
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=stackoftasks/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}/StackOfTasks

MAINTAINER=	hpp@laas.fr
COMMENT=	One implementation of kinematics-inverse-based control for humanoid robots.

USE_LANGUAGES+=	c++ fortran

DOXYGEN_PLIST_DIR+=	share/doc/stackoftasks

#CONFIGURE_ARGS+=-DBOOST_THREAD_LIB_NAME=
CONFIGURE_ARGS+=-DOPENHRP3_HOME=${PREFIX.openhrp}
CONFIGURE_ARGS+=-DGENERATE_DOC=1

include ../../path/jrl-walkgen/depend.mk
include ../../math/jrl-dynamics/depend.mk
include ../../interfaces/jrl-mal/depend.mk
include ../../interfaces/jrl-interface-dynamics/depend.mk
#include ../../architecture/openhrp-jrl/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk

