# robotpkg Makefile for:	architecture/genom-openhrp-plugin
# Created:			Anthony Mallet on Tue, 13 Nov 2007
#

DISTNAME=		genom-openhrp-plugin-1.4
CATEGORIES=		architecture
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=genom-openhrp-plugin/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}genom-openhrp-plugin

MAINTAINER=		gepetto@laas.fr
#HOMEPAGE=
COMMENT=		Interface plugin between GenoM and OpenHRP
LICENSE=		2-clause-bsd

USE_LANGUAGES+=		c c++

GNU_CONFIGURE=		yes

CONFIGURE_ARGS+=	--with-openhrp=${PREFIX.OpenHRP}

include ../../simulation/openhrp/depend.mk
include ../../robots/hrpsys-jrl/depend.mk
include ../../devel/omniORB/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
