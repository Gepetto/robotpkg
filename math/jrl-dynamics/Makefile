# $NetBSD: Makefile,v 1.21 2006/08/22 23:27:23 joerg Exp $
#

DISTNAME=	dynamics-jrljapan-${VERSION}
PKGNAME=	jrl-dynamics-${VERSION}
VERSION=	1.2
#PKGREVISION=	0

CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_JRL}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	JRL-Japan implementation of dynamic robot.

DEPENDS+=	jrl-interface-dynamics>=1.3:../../interfaces/jrl-interface-dynamics

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

include ../../mk/robotpkg.mk
