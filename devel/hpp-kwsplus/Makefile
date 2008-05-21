# $NetBSD$
#

DISTNAME=	kwsplus-${VERSION}
PKGNAME=	hpp-kwsplus-${VERSION}
VERSION=	1.4

CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Helper functions for KineoWorks(tm) package.

DEPENDS+=	hpp-kwsio>=1.0:../../devel/hpp-kwsio

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_PKG_CONFIG=	yes

CONFIGURE_ARGS+=	--with-lapack=${PREFIX.lapack}

#Options
PKG_SUPPORTED_OPTIONS+=	verbose1
PKG_OPTION_DESCR.verbose1=	Define level of verbosity
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

include ../../path/kineo-pp/depend.mk
include ../../math/lapack/depend.mk
include ../../mk/robotpkg.mk
