# robotpkg Makefile for:	hardware/platine-genom
# Created:			Anthony Mallet on Tue, 17 Jun 2008
#

DISTNAME=		platine-genom-0.3
CATEGORIES=		hardware
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	git softs.laas.fr:/git/robots/platine-genom

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for platine management.

LICENSE=		isc

GNU_CONFIGURE=		yes

GENOM_MODULE=		platine
GENOM_ARGS+=		-I${PREFIX.genBasic-genom}/include/genBasic
GENOM_ARGS+=		-I${PREFIX.pom-genom}/include/pom

include ../../architecture/genom/depend.mk

include ../../architecture/genBasic-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mk/robotpkg.mk
