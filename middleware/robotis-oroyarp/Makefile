# robotpkg Makefile for:	middleware/robotis-oroyarp
# Created:			Arnaud Degroote on Thu, 22 Apr 2010
#

OROYARP_VERSION=	1.2
PKGREVISION=		1
DISTNAME=		robotis-oroyarp-${OROYARP_VERSION}
CATEGORIES=		middleware
MASTER_SITES=		http://robotis.onera.fr/sites/robotis.onera.fr/files/
EXTRACT_SUFX=		.tar

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://robotis.onera.fr
COMMENT=		The Orocos / YARP binding
LICENSE=		gnu-lgpl-v3

USE_LANGUAGES=		c c++
CMAKE_ARGS+=		-DBUILD_EXAMPLE=off
CMAKE_ARGS+=		-DBoost_INCLUDE_DIRS=${PREFIX.boost-headers}/include
CMAKE_ARGS+=		-DBoost_LIBRARY_DIRS=${PREFIX.boost-libs}/lib

include ../../architecture/orocos-ocl/depend.mk
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../middleware/orocos-rtt/depend.mk
include ../../middleware/yarp/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
