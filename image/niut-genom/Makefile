# robotpkg Makefile for:	image/niut-genom
# Created:			Matthieu Herrb on Tue, 11 Jan 2011
#

DISTNAME=	niut-genom-0.1
CATEGORIES=	image

MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=niut-genom/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/niut-genom

MAINTAINER=	openrobots@laas.fr
COMMENT=	GenoM module for the NITE user tracker from PrimeSense
LICENSE=	isc

GENOM_MODULE=	niut

USE_LANGUAGES=	c c++


include ../../image/openni-nite/depend.mk
include ../../interfaces/genBasic-genom/depend.mk
include ../../architecture/genom/depend.mk
include ../../mk/robotpkg.mk
