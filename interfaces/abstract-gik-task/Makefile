# robotpkg Makefile for:	interfaces/abstract-gik-task
# Created:			Anthony Mallet on Fri, 15 Jun 2007
#

DISTNAME=	abstract-gik-task-${VERSION}
PKGNAME=	abstract-gik-task-${VERSION}
VERSION=	2.6

CATEGORIES=	interfaces
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=abstract-gik-task/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}jrlCIR-giktask

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	JRL abstract interface for generalized inverse kinematics tasks.
LICENSE=	modified-bsd

DOXYGEN_PLIST_DIR+=	share/doc/abstract-gik-task

include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../interfaces/abstract-robot-dynamics/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
