# $LAAS: Makefile 2009/09/09 13:48:16 mallet $
#
# Copyright (c) 2008-2009 LAAS/CNRS
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
#                                      Anthony Mallet on Wed Sep 17 2008
#

DISTNAME=	jrlmathtools-1.2
PKGNAME=	jrl-mathtools-1.2

CATEGORIES=	math
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=jrl-mathtools/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}algo/jrlMathTools

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Basic mathematical tools used in the JRL software.

USE_LANGUAGES+=		c++
DOXYGEN_PLIST_DIR+=	share/doc/jrlMathTools

include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
