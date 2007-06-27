# $NetBSD: Makefile,v 1.21 2006/08/22 23:27:23 joerg Exp $
#

DISTNAME=	dynamics-jrljapan-${VERSION}
PKGNAME=	jrl-dynamics-${VERSION}
VERSION=	1.3
#PKGREVISION=	0

CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_JRL}
NO_PUBLIC_SRC=	yes
NO_PUBLIC_BIN=	yes

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	JRL-Japan implementation of dynamic robot.

DEPENDS+=	jrl-interface-dynamics>=1.3:../../interfaces/jrl-interface-dynamics

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

BUILD_TARGET=	all doc
INSTALL_TARGET=	install install-doc

include ../../mk/robotpkg.mk
