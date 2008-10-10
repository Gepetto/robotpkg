# $LAAS: Makefile 2008/10/09 19:02:28 mallet $
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
# $NetBSD: Makefile,v 1.11 2008/04/28 21:35:25 jmmv Exp $

BOOST_PACKAGE=		headers
BOOST_COMMENT=		(build-time headers)
BOOST_CONFIG=		generate

include ../../devel/boost/Makefile.common

BJAM_ARGS+=		--without-* # disable all libraries

include ../../devel/boost-jam/depend.mk

NO_BUILD=		yes

include ../../mk/robotpkg.mk

do-install: bjam-install
	${FIND} ${PREFIX}/include/boost \
		-type f -print | ${XARGS} ${CHOWN} ${SHAREOWN}:${SHAREGRP}
	${FIND} ${PREFIX}/include/boost \
		-type d -print | ${XARGS} ${CHMOD} ${PKGDIRMODE}
