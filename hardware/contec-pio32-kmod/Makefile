# robotpkg Makefile for:	hardware/contec-pio32-kmod
# Created:			Matthieu Herrb on Mon, 22 Dec 2008
#

DISTNAME=	contec-pio32-kmod-1.0
PKGREVISION=	1
CATEGORIES=	hardware
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=linux/}

MAINTAINER=	openrobots@laas.fr
COMMENT=	Kernel driver for Contec PIO32 PCI card
LICENSE=	isc

ONLY_FOR_PLATFORM=	Linux-%

BUILD_TARGET=	default
KMOD_DIR=	lib/modules/${OS_VERSION}/kernel/drivers/char
KMOD=		contec_dio.ko
INSTALLATION_DIRS+=${KMOD_DIR}

include ../../mk/sysdep/sudo.mk
include ../../mk/robotpkg.mk

post-install: install-kmod

.PHONY: install-kmod
install-kmod:
	@${STEP_MSG} "Becoming \`\`root'' to install kernel module (sudo)"
	${SUDO} -u root ${CP} ${PREFIX}/${KMOD_DIR}/${KMOD} /${KMOD_DIR}/${KMOD}
	@${STEP_MSG} "Dropping \`\`root'' privileges."
