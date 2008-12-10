# $LAAS: Makefile 2008/12/10 23:32:29 tho $
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

DISTNAME=	blas
PKGNAME=	blas-1.0
PKGREVISION=	3

CATEGORIES=	math
MASTER_SITES= 	ftp://ftp.netlib.org/blas/ \
		ftp://netlib.bell-labs.com/netlib/blas/ \
		ftp://www.hensa.ac.uk/mirrors/netlib/blas/
EXTRACT_SUFX=   .tgz

MAINTAINER=     openrobots@laas.fr
HOMEPAGE=       http://www.netlib.org/blas/
COMMENT=        Basic Linear Algebra Subprograms (Fortran)

WRKSRC=		${WRKDIR}

INSTALLATION_DIRS=	lib

include ../../pkgtools/libtool/depend.mk
include ../../lang/gcc4-fortran/depend.mk
include ../../mk/robotpkg.mk
