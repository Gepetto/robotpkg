# robotpkg Makefile for:	hardware/sranger-genom
# Created:			Matthieu Herrb on Fri, 27 Aug 2010
#

DISTNAME=		sranger-genom-1.0
CATEGORIES=		hardware

MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=sranger/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/sranger-genom

MAINTAINER=		openrobots@laas.fr
COMMENT=		GenoM interface module for the MesaImaging Swiss Ranger

LICENSE=		isc

GNU_CONFIGURE=		yes
USE_LANGUAGES+=		c c++

GENOM_MODULE=		sranger

include ../../architecture/genom/depend.mk
include ../../graphics/primitiveShapes-libs/depend.mk
include ../../hardware/libmesasr/depend.mk
include ../../image/opencv/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../math/gbM/depend.mk
include ../../mk/robotpkg.mk
