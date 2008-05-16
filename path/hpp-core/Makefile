# $Id:$
#

DISTNAME=	hppcore-${VERSION}
PKGNAME=	hpp-core-${VERSION}
VERSION=	1.4

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Basic classes used as interfaces with KineoWorks(tm).

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes

# options
PKG_SUPPORTED_OPTIONS+=	with-body

PKG_OPTION_DESCR.with-body=	Use internal definition of ChppBody class.
PKG_OPTION_SET.with-body:=	CONFIGURE_ARGS+=	--enable-body
define PKG_OPTION_UNSET.with-body
CONFIGURE_ARGS+=	--disable-body
include ../../devel/hpp-model/depend.mk
endef

include ../../devel/hpp-kwsplus/depend.mk
include ../../mk/robotpkg.mk
