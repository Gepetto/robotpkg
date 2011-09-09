# robotpkg Makefile for:	hardware/sahand-kmod
# Created:			Matthieu Herrb on Thu, 10 Jun 2010
#

VERSION=	2008.01.10
PKGNAME=	sahand-kmod-$(VERSION)
DISTNAME=	sahand-linux_$(subst .,-,$(VERSION))

CATEGORIES=	hardware
COMMENT=	Schunk Antropomorphic Hand Linux driver

ONLY_FOR_PLATFORM=	Linux-%

INTERACTIVE_STAGE=	fetch
FETCH_MESSAGE+= " The file ${DISTNAME}${EXTRACT_SUFX} containing the sahand driver version ${VERSION}"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " must be put manually into:"
FETCH_MESSAGE+= "       ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}"

WRKSRC=		${WRKDIR}/SAHand/sahand_driver

BUILD_TARGET=	default
KMOD_DIR=	lib/modules/${OS_KERNEL_VERSION}/kernel/drivers/misc
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

include ../../pkgtools/install-sh/depend.mk
include ../../mk/sysdep/kernel.mk
include ../../mk/sysdep/sudo.mk
include ../../mk/robotpkg.mk
