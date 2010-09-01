# robotpkg Makefile for:	hri/mocap-genom
# Created:			Severin Lemaignan on Tue, 31 Aug 2010
#

DISTNAME=		mocap-genom-1.1
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=mocap-genom/}
MASTER_REPOSITORY=	git ssh://trac/git/robots/mocap-genom

MAINTAINER=		openrobots@laas.fr
COMMENT=		GeNoM module for Motion Capture, based on evart server
LICENSE=		isc


USE_LANGUAGES+=		c c++

GENOM_MODULE=		mocap

include ../../net/evart-client/depend.mk
include ../../architecture/genom/depend.mk

include ../../mk/robotpkg.mk
