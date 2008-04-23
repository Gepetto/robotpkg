# $NetBSD: Makefile,v 1.21 2006/08/22 23:27:23 joerg Exp $
#

DISTNAME=	hppdoc-${VERSION}
PKGNAME=	hpp-doc-${VERSION}
VERSION=	1.0

CATEGORIES=	doc
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	HPP Project documentation.

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

# options
PKG_SUPPORTED_OPTIONS+=	hpp-core

PKG_OPTION_DESCR.hpp-core=	Install hpp-core package if needed
define PKG_OPTION_SET.hpp-core
DEPENDS+=		hpp-core>=1.0:../../path/hpp-core
endef

include ../../mk/robotpkg.mk
