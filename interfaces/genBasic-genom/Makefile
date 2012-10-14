# robotpkg Makefile for:	interfaces/genBasic-genom
# Created:			A. degroote on Sat, 17 May 2008
#

DISTNAME=		genBasic-genom-0.4
CATEGORIES=		interfaces
PKGREVISION=		1

MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/genBasic-genom

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Common simple data structures for GenoM modules

LICENSE=		isc

GENOM_MODULE=		genBasic
GENOM_ARGS=		-a

include ../../architecture/genom/depend.mk
PKG_SUPPORTED_OPTIONS:=$(filter-out api,${PKG_SUPPORTED_OPTIONS})
PLIST.noapi=	@comment
PLIST_VARS+=	noapi

include ../../mk/robotpkg.mk
