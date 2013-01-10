# robotpkg Makefile for:	audio/clone-genom
# Created:			Matthieu Herrb on Wed, 21 Jan 2009
#

DISTNAME=	clone-genom-0.2
PKGREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=clone-genom/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}clone-genom

MAINTAINER=	openrobots@laas.fr
COMMENT=	3D Animated speaking head - genom component

ONLY_FOR_PLATFORM=	Linux-%

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-opengl=${PREFIX.mesa}
CONFIGURE_ARGS+=--with-glut=${PREFIX.freeglut}

GENOM_MODULE=	clone


include ../../architecture/genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../interfaces/genBasic-genom/depend.mk
include ../../mk/sysdep/freeglut.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
