# robotpkg Makefile for:	pkgtools/pkg-config
# Created:			Anthony Mallet on Wed, 19 Mar 2008
#

DISTNAME=		pkg-config-0.29
CATEGORIES=		pkgtools
MASTER_SITES=		http://pkgconfig.freedesktop.org/releases/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://pkgconfig.freedesktop.org/
COMMENT=		System for managing library compile/link flags
LICENSE=		gnu-gpl-v2

GNU_CONFIGURE=		yes

CONFIGURE_ARGS+=	--disable-host-tool
CONFIGURE_ARGS+=	--disable-threads
CONFIGURE_ARGS+=	--with-internal-glib

# fix a == in a `test`
SUBST_STAGE.test=	pre-configure
SUBST_MESSAGE.test=	Fixing bad '==' test operator
SUBST_SED.test=		-e 's/== "1"/= "1"/g'
SUBST_FILES.test=	glib/configure
SUBST_CLASSES+=		test

include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
