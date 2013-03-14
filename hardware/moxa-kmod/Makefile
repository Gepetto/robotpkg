# robotpkg Makefile for:	hardware/moxa-kmod
# Created:			Matthieu Herrb on Thu,  9 Sep 2010
#

PKGREVISION=	1
VERSION=	2.6.34.7
PKGNAME=	moxa-kmod-${VERSION}
DISTNAME=	linux-${VERSION}
EXTRACT_SUFX=	.tar.bz2

COMMENT=	Linux driver for the MOXA Smartio multiport serial cards
CATEGORIES=	hardware

LICENSE=	gnu-gpl-v2

ONLY_FOR_PLATFORM=	Linux-%
NOT_FOR_PLATFORM=	Fedora-18-%

MASTER_SITES=	http://www.kernel.org/pub/linux/kernel/v2.6/

WRKSRC=		${WRKDIR}/linux-${VERSION}/drivers/char

KMOD_DIR=	lib/modules/${OS_KERNEL_VERSION}/kernel/drivers/char

INSTALLATION_DIRS+=${KMOD_DIR}

MAKE_ENV+=	KMOD_DIR=${KMOD_DIR}
MAKE_FLAGS+=	KDIR=${PREFIX.kernel}
MAKE_FLAGS+=	IDIR=${KDIR}/kernel/drivers/char

pre-build:
	cp ${FILESDIR}/Makefile ${WRKSRC}/Makefile

include ../../mk/language/c.mk
include ../../mk/sysdep/kernel.mk
include ../../mk/robotpkg.mk
