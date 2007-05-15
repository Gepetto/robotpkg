# $NetBSD: Makefile,v 1.21 2006/08/22 23:27:23 joerg Exp $
#

DISTNAME=	abstractrobotdynamics-${VERSION}
PKGNAME=	jrl-interface-dynamics-${VERSION}
VERSION=	1.2
#PKGREVISION=	0

CATEGORIES=	interfaces
MASTER_SITES=	${MASTER_SITES_OPENROBOTS}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	JRL abstract interface for dynamic robot model.

DEPENDS+=	jrl-mal>=1.2:../../interfaces/jrl-mal

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

include ../../mk/robotpkg.mk
