# $LAAS: Makefile 2008/11/28 16:04:25 mallet $
#
# Copyright (c) 2007-2008 LAAS/CNRS
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
#                                      Anthony Mallet on Mon Jan 29 2007
#

DISTNAME=		boost-numeric-bindings-20070129
PKGREVISION=		1
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_ROBOTPKG}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://sourceforge.net/projects/boost-sandbox
COMMENT=		C++ bindings for LAPACK and BLAS libraries.

USE_LANGUAGES+=		c++

WRKSRC=			${WRKDIR}/boost
NO_CONFIGURE=		yes
NO_BUILD=		yes

include ../../devel/boost-headers/depend.mk
include ../../mk/robotpkg.mk

do-install:
	cd ${WRKSRC} &&	${PAX} -rw -pm . ${PREFIX}/include/boost
	cd files && ${PAX} -rw -pm orgqr.hpp  ${PREFIX}/include/boost/numeric/bindings/lapack
