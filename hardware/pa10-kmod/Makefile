#
# Copyright (c) 2008,2010 CNRS/LAAS
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#

DISTNAME=	pa10-kmod-${VERSION}
VERSION=	1.1
CATEGORIES=	hardware
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=linux/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/pa10-kmod

MAINTAINER=	openrobots@laas.fr
COMMENT=	Kernel driver for Mitsubishi PA10 Arm controller

BUILD_TARGET=	default
KMOD_DIR=	lib/modules/${OS_VERSION}/kernel/drivers/char
KMOD=		papci.ko

INSTALLATION_DIRS+=${KMOD_DIR}

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/sudo.mk
include ../../mk/robotpkg.mk

post-install: install-kmod

.PHONY: install-kmod
install-kmod:
	@${STEP_MSG} "Becoming \`\`root'' to install kernel module (sudo)"
	${SUDO} -u root ${CP} ${PREFIX}/${KMOD_DIR}/${KMOD} /${KMOD_DIR}/${KMOD}
	@${STEP_MSG} "Dropping \`\`root'' privileges."
