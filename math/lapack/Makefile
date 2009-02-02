# $LAAS: Makefile 2009/02/02 14:36:58 mallet $
#
# Copyright (c) 2007-2009 LAAS/CNRS
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

DISTNAME=	lapack-3.1.0
PKGREVISION=	1

CATEGORIES=	math
MASTER_SITES=	ftp://ftp.netlib.org/lapack/			\
		ftp://netlib.bell-labs.com/netlib/lapack/	\
		ftp://www.hensa.ac.uk/mirrors/netlib/lapack/	\
		ftp://netlib.no/netlib/lapack/			\
		ftp://ftp.zib.de/netlib/lapack/
EXTRACT_SUFX=	.tgz

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.netlib.org/lapack/index.html
COMMENT=	Linear Algebra PACKage.

BUILD_TARGET=		lapacklib
USE_LANGUAGES+=		fortran

INSTALLATION_DIRS=	lib

include ../../math/blas/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/robotpkg.mk

do-install:
	${TOOLS.libtool} --mode=install ${INSTALL_DATA}	\
		${WRKSRC}/liblapack.la ${PREFIX}/lib
