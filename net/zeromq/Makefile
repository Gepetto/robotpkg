# robotpkg Makefile for:	net/zeromq
# Created:			Azamat Shakhimardanov on Thu, 7 Oct 2010
#

PKGVERSION=	2.0.10
DISTNAME=	zeromq-${PKGVERSION_NOREV}
CATEGORIES=	net
MASTER_SITES=   http://www.zeromq.org/local--files/area:download/

MAINTAINER=	robotpkg@laas.fr
HOMEPAGE=	http://www.zeromq.org/
COMMENT=	Small and fast socket communication library
LICENSE=	gnu-lgpl-v3

USE_LANGUAGES=	c c++
GNU_CONFIGURE=	yes

# pgm option
PKG_SUPPORTED_OPTIONS+=	pgm
PKG_SUGGESTED_OPTIONS+=	pgm
PKG_OPTION_DESCR.doc?=	Compile Pragmatic General Multicast (PGM) support

define PKG_OPTION_SET.pgm
  CONFIGURE_ARGS+=	--with-pgm

  include ../../pkgtools/pkg-config/depend.mk
  include ../../mk/sysdep/glib2.mk
  include ../../mk/sysdep/perl.mk
  include ../../mk/sysdep/python.mk
endef

include ../../mk/robotpkg.mk
