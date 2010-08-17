# robotpkg Makefile for:	devel/boost-libs
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

# Borrowed from NetBSD pkgsrc,
# $NetBSD: Makefile,v 1.11 2008/05/09 12:50:31 drochner Exp $

BOOST_PACKAGE=		libs
BOOST_COMMENT=		(binary libraries)
BOOST_CONFIG=		installed

include ../../devel/boost/Makefile.common

BJAM_ARGS+=		--without-python

BUILD_LOG_ETA=		
INSTALL_LOG_ETA=	

include ../../devel/boost-jam/depend.mk
include ../../archivers/bzip2/depend.mk
include ../../archivers/zlib/depend.mk
include ../../mk/robotpkg.mk

do-build: bjam-build
	@${TRUE}

do-install: boost-install-libs
	@${TRUE}
