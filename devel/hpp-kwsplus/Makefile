# $NetBSD$
#

DISTNAME=	kwsplus-${VERSION}
PKGNAME=	hpp-kwsplus-${VERSION}
VERSION=	1.3.1

CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Helper functions for KineoWorks(tm) package.

DEPENDS+=	hpp-kwsio>=1.0:../../devel/hpp-kwsio
DEPENDS+=	kineo-pp>=2.04.306:../../path/kineo-pp

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_PKG_CONFIG=	yes

CONFIGURE_ARGS+=	--with-lapack=${PREFIX.lapack}

include ../../math/lapack/depend.mk
include ../../mk/robotpkg.mk
