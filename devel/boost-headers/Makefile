# robotpkg Makefile for:	devel/boost-headers
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

# Borrowed from NetBSD pkgsrc,
# $NetBSD: Makefile,v 1.11 2008/04/28 21:35:25 jmmv Exp $

BOOST_PACKAGE=		headers
BOOST_COMMENT=		(build-time headers)

PREFER.boost?=		robotpkg
include ../../devel/boost/Makefile.common

NO_BUILD=		yes
BJAM_ARGS+=		--without-* # disable all libraries

include ../../devel/boost-jam/depend.mk
include ../../mk/robotpkg.mk

do-install: bjam-install
	${RUN}${FIND} ${PREFIX}/include/boost \
		-type f -print | ${XARGS} ${CHOWN} ${SHAREOWN}:${SHAREGRP}
	${RUN}${FIND} ${PREFIX}/include/boost \
		-type d -print | ${XARGS} ${CHMOD} ${PKGDIRMODE}
