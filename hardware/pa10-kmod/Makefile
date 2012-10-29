# robotpkg Makefile for:	hardware/pa10-kmod
# Created:			Matthieu Herrb on Mon, 22 Dec 2008
#

DISTNAME=	pa10-kmod-1.1
PKGREVISION=	1
CATEGORIES=	hardware
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=linux/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/pa10-kmod

MAINTAINER=	openrobots@laas.fr
COMMENT=	Kernel driver for Mitsubishi PA10 Arm controller

ONLY_FOR_PLATFORM=	Linux-%
NOT_FOR_PLATFORM=	Fedora-15-% Fedora-16-% Fedora-17-%
NOT_FOR_PLATFORM+=	Ubuntu-11.04-% Ubuntu-11.10-% Ubuntu-12.04-%
NOT_FOR_PLATFORM+=	Ubuntu-12.10-%

BUILD_TARGET=	default
KMOD_DIR=	lib/modules/${OS_KERNEL_VERSION}/kernel/drivers/char
KMOD=		papci.ko

INSTALLATION_DIRS+=${KMOD_DIR}

include ../../mk/sysdep/kernel.mk
include ../../mk/sysdep/sudo.mk
include ../../mk/robotpkg.mk

post-install: install-kmod

.PHONY: install-kmod
install-kmod:
	@${STEP_MSG} "Becoming \`\`root'' to install kernel module (sudo)"
	${SUDO} -u root ${CP} ${PREFIX}/${KMOD_DIR}/${KMOD} /${KMOD_DIR}/${KMOD}
	@${STEP_MSG} "Dropping \`\`root'' privileges."
