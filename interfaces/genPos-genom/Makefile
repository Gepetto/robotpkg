# robotpkg Makefile for:	interfaces/genPos-genom
# Created:			Arnaud Degroote on Mon, 19 May 2008
#

DISTNAME=		genPos-genom-0.3
CATEGORIES=		interfaces
PKGREVISION=		1

MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/genPos-genom

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Common position-related data structures for GenoM

LICENSE=		isc

GENOM_MODULE=		genPos
GENOM_ARGS=		-a

include ../../architecture/genom/depend.mk
PKG_SUPPORTED_OPTIONS:=$(filter-out api,${PKG_SUPPORTED_OPTIONS})
PLIST.noapi=	@comment
PLIST_VARS+=	noapi

include ../../mk/robotpkg.mk
