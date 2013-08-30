# robotpkg Makefile for:	pkgtools/pkg-config
# Created:			Anthony Mallet on Wed, 19 Mar 2008
#

DISTNAME=		pkg-config-0.23
CATEGORIES=		pkgtools
MASTER_SITES=		http://pkgconfig.freedesktop.org/releases/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://pkgconfig.freedesktop.org/
COMMENT=		System for managing library compile/link flags
LICENSE=		gnu-gpl-v2

GNU_CONFIGURE=		yes

CONFIGURE_ARGS+=	--disable-threads

include ../../pkgtools/libtool/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

# hack: there is a recursive configure script to be patched against CXXCPP
# failures
SUBST_FILES.fixcxxcpp+=	glib-*/configure
