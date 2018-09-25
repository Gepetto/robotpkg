# robotpkg Makefile for:	motion/orocos-kdl
# Created:			Anthony Mallet on Thu, 14 Aug 2014
#

VERSION=	1.4.0
DISTNAME=	orocos-kdl-${VERSION}
DISTFILES=	${VERSION}${EXTRACT_SUFX}
CATEGORIES=	motion
DIST_SUBDIR=	orocos-kdl
DIST_URL=	orocos/orocos_kinematics_dynamics/archive/v
MASTER_SITES=	${MASTER_SITE_GITHUB:=${DIST_URL}}

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.orocos.org/kdl
COMMENT=	Rigid body kinematics calculations
LICENSE=	gnu-lgpl-v2

WRKSRC=		${WRKDIR}/orocos_kinematics_dynamics-${VERSION}/orocos_kdl

CMAKE_ARGS+=	-DEIGEN3_INCLUDE_DIR=${PREFIX.eigen3}/include/eigen3

include ../../math/eigen3/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
