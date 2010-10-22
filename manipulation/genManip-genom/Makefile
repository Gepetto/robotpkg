# robotpkg Makefile for:	manipulation/genManip-genom
# Created:			Xavier Broquere on Tue, 20 Apr 2010
#


DISTNAME=		genManip-genom-0.7
CATEGORIES=		manipulation

MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=genManip-genom/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/genManip-genom

MAINTAINER=		xavier.broquere@laas.fr

COMMENT=		Common manipulation-related structures for GenoM modules
LICENSE=		gnu-lgpl-v3

GENOM_MODULE=		genManip
GENOM_ARGS=		-a

include ../../architecture/genom/depend.mk
PKG_SUPPORTED_OPTIONS:=$(filter-out api,${PKG_SUPPORTED_OPTIONS})

include ../../architecture/genBasic-genom/depend.mk
include ../../math/gbM/depend.mk
include ../../mk/robotpkg.mk
