# robotpkg Makefile for:	interfaces/jrl-interface-dynamics
# Created:			Anthony Mallet on Mon, 14 May 2007
#

DISTNAME=	abstractrobotdynamics-${VERSION}
PKGNAME=	jrl-interface-dynamics-${VERSION}
VERSION=	1.17

CATEGORIES=	interfaces
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=jrl-interface-dynamics/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}abstractRobotDynamics

DOXYGEN_PLIST_DIR+=	share/doc/abstractRobotDynamics

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	JRL abstract interface for dynamic robot model.
LICENSE =	original-bsd

USE_LANGUAGES+=	c c++

include ../../interfaces/jrl-mal/depend.mk

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
