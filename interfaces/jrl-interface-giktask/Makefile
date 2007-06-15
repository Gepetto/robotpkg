# $NetBSD: Makefile,v 1.21 2006/08/22 23:27:23 joerg Exp $
#

DISTNAME=	abstractgiktask-${VERSION}
PKGNAME=	jrl-interface-giktask-${VERSION}
VERSION=	1.0
#PKGREVISION=	0

CATEGORIES=	interfaces
MASTER_SITES=	${MASTER_SITE_ROBOTPKG}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	JRL abstract interface for generalized inverse kinematics tasks.

DEPENDS+=	jrl-interface-dynamics>=1.3:../../interfaces/jrl-interface-dynamics

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

include ../../mk/robotpkg.mk
