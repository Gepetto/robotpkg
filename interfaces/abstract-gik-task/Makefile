# robotpkg Makefile for:	interfaces/abstract-gik-task
# Created:			Anthony Mallet on Fri, 15 Jun 2007
#

DISTNAME=	abstract-gik-task-${VERSION}
VERSION=	2.7
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=abstract-gik-task/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}algo/abstract-gik-task

CATEGORIES=	interfaces
MAINTAINER=	hpp@laas.fr
COMMENT=	JRL abstract interface for generalized inverse kinematics tasks.
LICENSE=	modified-bsd

DYNAMIC_PLIST_DIRS+=	share/doc/abstract-gik-task

include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../interfaces/abstract-robot-dynamics/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
