# $LAAS: Makefile 2010/01/07 13:33:05 mallet $
#
# Copyright (c) 2007-2010 LAAS/CNRS
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

DISTNAME=		boost-numeric-bindings-20090215
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_ROBOTPKG}
MASTER_REPOSITORY=\
  cvs \
  :pserver:boost-sandbox.cvs.sourceforge.net:/cvsroot/boost-sandbox \
  boost-sandbox/boost/numeric/bindings

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://sourceforge.net/projects/boost-sandbox
COMMENT=		C++ bindings for LAPACK and BLAS libraries.

INSTALLATION_DIRS=	include/boost/numeric/bindings

WRKSRC=			${WRKDIR}/boost
NO_CONFIGURE=		yes
NO_BUILD=		yes

include ../../devel/boost-headers/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../mk/robotpkg.mk

do-install:
	cd ${WRKSRC} && ${PAX} -rw -pm . ${PREFIX}/${INSTALLATION_DIRS}
	cd ${FILESDIR} && \
	  ${PAX} -rw -pm orgqr.hpp  ${PREFIX}/${INSTALLATION_DIRS}/lapack
