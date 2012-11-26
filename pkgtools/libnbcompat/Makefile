# robotpkg Makefile for:	pkgtools/libnbcompat
# Created:			Anthony Mallet on Wed, 6 Jun 2007
#

DISTNAME=		libnbcompat-20120702
CATEGORIES=		pkgtools devel
MASTER_SITES=		# empty
DISTFILES=		# empty

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.NetBSD.org/
COMMENT=		Portable NetBSD compatibility library
LICENSE=		2-clause-bsd modified-bsd original-bsd

NO_PKGTOOLS_REQD_CHECK=	yes
NO_CHECKSUM=		yes

GNU_CONFIGURE=		yes
MAKE_ENV+=		LIBMODE=644
CONFIGURE_ARGS+=	--enable-bsd-getopt --enable-db

include ../../mk/robotpkg.mk

do-extract:
	@${CP} -Rp ${CURDIR}/dist ${WRKSRC}
