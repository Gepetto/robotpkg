# robotpkg Makefile for:	interfaces/genHum-genom
# Created:			Matthieu Herrb on Tue, 24 Mar 2009
#

DISTNAME=		genHum-genom-1.1
CATEGORIES=		interfaces
PKGREVISION=		1

MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/genHum-genom

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Common data structures for human models

LICENSE=		isc

GENOM_MODULE=		genHum
GENOM_ARGS=		-a

include ../../architecture/genom/depend.mk
PKG_SUPPORTED_OPTIONS:=$(filter-out api,${PKG_SUPPORTED_OPTIONS})
PLIST.noapi=	@comment
PLIST_VARS+=	noapi

include ../../mk/robotpkg.mk
