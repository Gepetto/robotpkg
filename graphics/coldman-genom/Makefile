# robotpkg Makefile for:	manipulation/coldman-genom
# Created:			Anthony Mallet on Fri, 15 Oct 2010
#

DISTNAME=		coldman-genom-1.3
PKGREVISION=		1
CATEGORIES=		manipulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=coldman-genom/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/coldman-genom

MAINTAINER=		xavier.broquere@laas.fr
COMMENT=		Display collision detection information
LICENSE=		gnu-lgpl-v3

USE_LANGUAGES+=				c c++
GENOM_MODULE=				coldman
define PKG_OPTION_UNSET.api
  include ../../graphics/coldman-libs/depend.mk
  DEPEND_ABI.coldman-libs+=		coldman-libs~display
endef

include ../../architecture/genom/depend.mk
include ../../manipulation/genManip-genom/depend.mk
include ../../mk/robotpkg.mk
