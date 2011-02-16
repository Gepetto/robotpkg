# robotpkg Makefile for:	net/libfetch
# Created:			Anthony Mallet on Sat, 19 Apr 2008
#

DISTNAME=	libfetch-2.26
CATEGORIES=	net
MASTER_SITES=	# empty
DISTFILES=	# empty

NO_CHECKSUM=	yes

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.FreeBSD.org/
COMMENT=	Library to access HTTP/FTP server
LICENSE=	modified-bsd

BUILD_TARGET=	depend all
INSTALL_TARGET=	install includes

# ssl option
PKG_SUPPORTED_OPTIONS+=	ssl
PKG_OPTION_DESCR.ssl?=	Enable OpenSSL support

define PKG_OPTION_SET.ssl
  INCLUDE_DIRS.openssl+=	include
  BUILD_MAKE_FLAGS+=		FETCH_WITH_OPENSSL=yes
  include ../../mk/sysdep/openssl.mk
endef

LIBNBCOMPAT_STYLE=inplace
include ../../pkgtools/libnbcompat/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/robotpkg.mk

do-extract:
	${CP} -Rp ${CURDIR}/dist ${WRKSRC}
