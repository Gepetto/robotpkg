# robotpkg Makefile for:	pkgtools/libnbcompat
# Created:			Anthony Mallet on Wed, 6 Jun 2007
#

DISTNAME=		libnbcompat-20090610
CATEGORIES=		pkgtools devel
MASTER_SITES=		# empty
DISTFILES=		# empty

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.NetBSD.org/
COMMENT=		Portable NetBSD compatibility library

NO_PKGTOOLS_REQD_CHECK=	yes
NO_CHECKSUM=		yes

GNU_CONFIGURE=		yes
MAKE_ENV+=		LIBMODE=644

CONFIGURE_LOG_ETA=	345

include ../../mk/robotpkg.mk

do-extract:
	@${CP} -Rp ${CURDIR}/dist ${WRKSRC}
