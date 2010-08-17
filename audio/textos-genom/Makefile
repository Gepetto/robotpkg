# robotpkg Makefile for:	audio/textos-genom
# Created:			Anthony Mallet on Mon, 9 Mar 2009
#

DISTNAME=	textos-genom-1.0.2
CATEGORIES=	audio
MAINTAINER=	mallet@laas.fr
#HOMEPAGE=	http://softs.laas.fr/openrobots/distfiles/textos-genom/
COMMENT=	Festival Speech Synthesis system - GenoM module
LICENSE=	2-clause-bsd

MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=textos-genom/}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/textos-genom

GENOM_MODULE=	textos
USE_LANGUAGES=	c c++

define PKG_OPTION_UNSET.api
  CONFIGURE_ARGS+=	--with-festival=${PREFIX.festival}
  include ../../audio/festival/depend.mk
endef

include ../../architecture/genom/depend.mk
include ../../mk/robotpkg.mk
