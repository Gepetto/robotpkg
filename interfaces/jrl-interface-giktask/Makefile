# robotpkg Makefile for:	interfaces/jrl-interface-giktask
# Created:			Anthony Mallet on Fri, 15 Jun 2007
#

DISTNAME=	abstractgiktask-${VERSION}
PKGNAME=	jrl-interface-giktask-${VERSION}
VERSION=	2.4

CATEGORIES=	interfaces
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}jrlCIR-giktask

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	JRL abstract interface for generalized inverse kinematics tasks.
LICENSE=	modified-bsd

DOXYGEN_PLIST_DIR+=	share/doc/abstractGikTask
GNU_CONFIGURE=	yes

include ../../mk/sysdep/doxygen.mk
include ../../interfaces/jrl-interface-dynamics/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
