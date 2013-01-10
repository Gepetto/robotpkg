# robotpkg Makefile for:	audio/speett-genom
# Created:			Anthony Mallet on Sat, 7 Mar 2009
#

DISTNAME=	speett-genom-1.0
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=speett-genom/}
MASTER_REPOSITORY=${MASTER_REPOSITORY_OPENROBOTS}speett-genom

MAINTAINER=	mallet@laas.fr
#HOMEPAGE=	http://softs.laas.fr/openrobots/distfiles/speett-genom/
COMMENT=	Speech recognition engine based on Sphinx2 - GenoM module
LICENSE=	2-clause-bsd

GENOM_MODULE=	speett

define PKG_OPTION_UNSET.api
  CONFIGURE_ARGS+=--with-sphinx2=${PREFIX.sphinx2}
  include ../../audio/sphinx2/depend.mk
endef

include ../../architecture/genom/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
