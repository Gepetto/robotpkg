# robotpkg Makefile for:	hardware/ieee1394-kmod
# Created:			Matthieu Herrb on Thu,  9 Sep 2010
#

VERSION=	2.6.34.7
PKGNAME=	ieee1394-kmod-${VERSION}
DISTNAME=	linux-${VERSION}
EXTRACT_SUFX=	.tar.bz2

COMMENT=	Linux kernel modules for IEEE 1394
CATEGORIES=	hardware

LICENSE=	gnu-gpl-v2

ONLY_FOR_PLATFORM=	Linux-%
NOT_FOR_PLATFORM=	Fedora-15-% Fedora-16-%
NOT_FOR_PLATFORM+=	Ubuntu-11.04-% Ubuntu-11.10-% Ubuntu-12.04-%

MASTER_SITES=	http://www.kernel.org/pub/linux/kernel/v2.6/

WRKSRC=		${WRKDIR}/linux-${VERSION}/drivers/ieee1394

KSRCDIR=	/lib/modules/${OS_KERNEL_VERSION}/build
KMOD_DIR=	lib/modules/${OS_KERNEL_VERSION}/kernel/drivers/char

INSTALLATION_DIRS+=${KMOD_DIR}

MAKE_ENV+=	KMOD_DIR=${KMOD_DIR}

pre-build:
	cp ${FILESDIR}/Makefile ${WRKSRC}/Makefile

include ../../mk/robotpkg.mk
