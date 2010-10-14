# robotpkg Makefile for:	graphics/pqp-libs
# Created:			Severin Lemaignan on Tue, 31 Aug 2010
#
VERSION=		1.3
PKGREVISION=		1
DISTNAME=		pqp-${VERSION}
MASTER_SITES=		http://gamma.cs.unc.edu/software/downloads/SSV/

CATEGORIES=		graphics
HOMEPAGE=		http://gamma.cs.unc.edu/SSV/
MAINTAINER=		mallet@laas.fr
COMMENT=		A Proximity Query Package
LICENSE=		pqp-license

USE_LANGUAGES+=		c++
NO_CONFIGURE=		yes
BUILD_DIRS=		PQP_v${PKGVERSION_NOREV}
INSTALLATION_DIRS=	include/pqp

include ../../pkgtools/libtool/depend.mk
include ../../mk/robotpkg.mk
