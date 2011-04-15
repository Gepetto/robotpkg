# robotpkg Makefile for:	localization/mocap-genom
# Created:			Séverin Lemaignan on Wed, 1 Sep 2010
#

DISTNAME=		mocap-genom-1.2
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=mocap-genom/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/mocap-genom

MAINTAINER=		openrobots@laas.fr
COMMENT=		GenoM module exporting raw motion capture data
LICENSE=		isc


USE_LANGUAGES+=		c c++

GENOM_MODULE=		mocap

include ../../net/evart-client/depend.mk
include ../../architecture/genom/depend.mk

include ../../mk/robotpkg.mk
