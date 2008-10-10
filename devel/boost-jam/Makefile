# $LAAS: Makefile 2008/10/10 14:40:00 mallet $
#
# Copyright (c) 2008 LAAS/CNRS
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
#                                      Anthony Mallet on Thu Oct  9 2008
#

# Borrowed from NetBSD pkgsrc,
# $NetBSD: Makefile,v 1.3 2008/01/04 19:58:40 jmmv Exp $

BOOST_PACKAGE=		jam
BOOST_COMMENT=		(Boost.Jam utility)
BOOST_CONFIG=		no

include ../../devel/boost/Makefile.common

SUBST_CLASSES+=		bb
SUBST_MESSAGE.bb=	Fixing path to Boost.Build files.
SUBST_STAGE.bb=		pre-build
SUBST_FILES.bb=		tools/jam/src/Jambase
SUBST_SED.bb=		-e 's,/usr/share/boost-build,${PREFIX}/share/boost-build,g'

INSTALLATION_DIRS=	bin

include ../../devel/boost-build/depend.mk
include ../../mk/robotpkg.mk

do-build:
	cd ${WRKSRC}/tools/jam/src && \
	    ${SETENV} ${MAKE_ENV} ${SH} ./build.sh ${BOOST_TOOLSET}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/tools/jam/src/bin.*/bjam ${PREFIX}/bin
