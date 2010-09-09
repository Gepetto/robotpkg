# robotpkg Makefile for:	hardware/moxa-kmod
# Created:			Matthieu Herrb on Thu,  9 Sep 2010
#

VERSION=	2.6.34.6
PKGNAME=	moxa-kmod-${VERSION}
DISTNAME=	linux-${VERSION}
EXTRACT_SUFX=	.tar.bz2

COMMENT=	Linux driver for the MOXA Smartio multiport serial cards
CATEGORIES=	hardware

LICENSE=	gnu-gpl-v2

ONLY_FOR_PLATFORM=	Linux-%

MASTER_SITES=	http://www.kernel.org/pub/linux/kernel/v2.6/

WRKSRC=		${WRKDIR}/linux-${VERSION}/drivers/char

KSRCDIR=	/lib/modules/${OS_VERSION}/build
KMOD_DIR=	lib/modules/${OS_VERSION}/kernel/drivers/char

INSTALLATION_DIRS+=${KMOD_DIR}

MAKE_ENV+=	KMOD_DIR=${KMOD_DIR}

pre-build:
	cp ${FILESDIR}/Makefile ${WRKSRC}/Makefile

include ../../mk/robotpkg.mk
