# robotpkg Makefile for:	pkgtools/pax
# Created:			Anthony Mallet on Thu, 7 Dec 2006
#

DISTNAME=		pax-20080110
CATEGORIES=		pkgtools
MASTER_SITES=		# empty
DISTFILES=		# empty

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.NetBSD.org/
COMMENT=		POSIX standard archiver with many extensions
LICENSE=		modified-bsd
NOT_FOR_PLATFORM=	# empty

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--bindir=${PREFIX}/sbin
CONFIGURE_ARGS+=	--program-transform-name='s/^/robotpkg_/'

NO_CHECKSUM=		yes

LIBNBCOMPAT_STYLE=	inplace
include ../../pkgtools/libnbcompat/depend.mk

include ../../mk/robotpkg.mk

do-extract:
	${CP} -Rp ${CURDIR}/dist ${WRKSRC}
