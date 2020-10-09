# robotpkg Makefile for:	pkgtools/tnftp
# Created:			Anthony Mallet on Thu, 7 Dec 2006
#

#
# This version of tnftp installs into ${PREFIX/sbin} as tnftp.
#

DISTNAME=		tnftp-20151004
CATEGORIES=		pkgtools

MASTER_SITES=		# empty
DISTFILES=		# empty

# NetBSD distfile obtained from: ftp://ftp.NetBSD.org/pub/NetBSD/misc/tnftp

MAINTAINER=		openrobot@laas.fr
COMMENT=		The enhanced FTP client in NetBSD
LICENSE=		2-clause-bsd

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--bindir=${PREFIX}/sbin
CONFIGURE_ARGS+=	--with-socks=no

NOT_FOR_PLATFORM=	# empty
NO_CHECKSUM=		yes

# suppress useless warnings
CFLAGS+=		-Wno-unused-result -Wno-implicit-function-declaration

# ssl option
PKG_SUPPORTED_OPTIONS+=	ssl
PKG_SUGGESTED_OPTIONS+=	ssl
PKG_OPTION_DESCR.ssl?=	Enable OpenSSL support

define PKG_OPTION_SET.ssl
  CONFIGURE_ARGS+=	--enable-ssl --with-openssl=${PREFIX.openssl}
  include ../../mk/sysdep/openssl.mk
endef
define PKG_OPTION_UNSET.ssl
  CONFIGURE_ARGS+=	--disable-ssl
endef

include ../../mk/sysdep/termcap.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

do-extract:
	@${CP} -Rp ${CURDIR}/dist ${WRKSRC}
