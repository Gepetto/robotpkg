#
# Copyright (c) 2009 CNRS/LAAS
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

VERSION=	2008.01.10
PKGNAME=	sahand-kmod-$(VERSION)
DISTNAME=	sahand-linux_$(subst .,-,$(VERSION))

CATEGORIES=	hardware
COMMENT=	Schunk Antropomorphic Hand Linux driver

INTERACTIVE_STAGE=	fetch
FETCH_MESSAGE+= " The file ${DISTNAME}${EXTRACT_SUFX} containing the sahand driver version ${VERSION}"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " must be put manually into:"
FETCH_MESSAGE+= "       ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}"

WRKSRC=		${WRKDIR}/SAHand/sahand_driver

BUILD_TARGET=	default
KMOD_DIR=	lib/modules/${OS_VERSION}/kernel/drivers/misc
KMOD=		sahand_driver.ko

INSTALLATION_DIRS+=${KMOD_DIR}

RESTRICTED=	You cannot redistribute this software.
NO_PUBLIC_SRC=	${RESTRICTED}
NO_PUBLIC_BIN=	${RESTRICTED}

do-install:
	(cd ${WRKSRC}; \
		${INSTALL_DATA} -c ${KMOD} ${PREFIX}/${KMOD_DIR} ) 
	(cd ${WRKSRC}; \
	 	${INSTALL_PROGRAM} load_sahand_driver.sh ${PREFIX}/bin)
	(cd ${WRKSRC}; \
		${INSTALL_PROGRAM} unload_sahand_driver.sh ${PREFIX}/bin )
	@${STEP_MSG} "Becoming \`\`root'' to install kernel module (sudo)"
	${SUDO} -u root ${CP} ${PREFIX}/${KMOD_DIR}/${KMOD} /${KMOD_DIR}/${KMOD}
	@${STEP_MSG} "Dropping \`\`root'' privileges."

include ../../mk/sysdep/sudo.mk
include ../../mk/robotpkg.mk
