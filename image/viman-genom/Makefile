# robotpkg Makefile for:	image/viman-genom
# Created:			Séverin Lemaignan on Tue, 31 Aug 2010
#

DISTNAME=		viman-genom-1.1
CATEGORIES=		image
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=viman-genom/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/viman-genom

MAINTAINER=		openrobots@laas.fr
COMMENT=		Pattern-based marker detection and localization

# Viman license is GPL because it links with ARToolKit which is GPL.
LICENSE=		gnu-gpl-v2

USE_LANGUAGES+=		c c++

GENOM_MODULE=		viman

include ../../architecture/genom/depend.mk
include ../../image/viam-genom/depend.mk
include ../../image/artoolkitplus/depend.mk

include ../../mk/robotpkg.mk
