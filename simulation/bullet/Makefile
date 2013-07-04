# robotpkg Makefile for:	simulation/bullet
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

VERSION=	2.81
DISTNAME=	bullet-${VERSION}-rev2613
PKGNAME=	bullet-${VERSION}
MASTER_SITES=	http://bullet.googlecode.com/files/
CATEGORIES=	simulation
EXTRACT_SUFX=	.tgz

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://bulletphysics.org/
COMMENT=	Collision detection, soft body and rigid body dynamics library
LICENSE=	mit

CMAKE_ARGS+=	-DBUILD_SHARED_LIBS=ON

include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/freeglut.mk
include ../../mk/sysdep/libX11.mk
include ../../mk/sysdep/libXext.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/robotpkg.mk
