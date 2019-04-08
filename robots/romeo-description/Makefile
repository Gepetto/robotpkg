# robotpkg Makefile for:	robots/romeo-description
# Created:			Aurélie Clodic on Wed, 11 Jun 2014
#
VERSION=		0.5.1
DISTNAME=		romeo_description-${VERSION}
PKGNAME=		romeo-description-${VERSION}
MASTER_URL=		laas/romeo/releases/download/v${VERSION}
MASTER_SITES=		${MASTER_SITE_GITHUB:=${MASTER_URL}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}laas/romeo

CATEGORIES=		robots
COMMENT=		ROS Aldebaran Robotics Romeo robot model description
LICENSE=		2-clause-bsd
MAINTAINER=		hpp@laas.fr

DYNAMIC_PLIST_DIRS+=	share/doc/romeo_description

CMAKE_ARGS+=		-DCMAKE_INSTALL_LIBDIR=lib

include ../../devel/ros-catkin/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
