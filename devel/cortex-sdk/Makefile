# robotpkg Makefile for:	devel/cortex-sdk
# Created:			Anthony Mallet on Tue, 27 Jan 2009
#

VERSION=		1.0.3
DISTNAME=		SDK2_v${VERSION}_win32
PKGNAME=		cortex-sdk-${VERSION}
EXTRACT_SUFX=		.zip

CATEGORIES=		devel
MASTER_SITES=

CONFLICTS+=             evart-sdk	# old package for EvaRT

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.motionanalysis.com/html/industrial/cortex.html
COMMENT=		Cortex Software Development Kit.

PREFIX?=		${LOCALBASE}/i386-mingw32
WRKSRC=			${WRKDIR}

LICENSE=                motion-analysis-license
RESTRICTED=             You cannot redistribute this software.
NO_PUBLIC_SRC=          ${RESTRICTED}
NO_PUBLIC_BIN=          ${RESTRICTED}

INTERACTIVE_STAGE=      fetch
FETCH_MESSAGE+= " The file ${DISTNAME}${EXTRACT_SUFX} containing Cortex SDK2 ${VERSION}"
FETCH_MESSAGE+= " must be put manually into:"
FETCH_MESSAGE+= "       ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " This file is located on the Cortex CDROM, in the Sdk2 directory."

NO_CONFIGURE=		yes
NO_BUILD=		yes

include ../../mk/robotpkg.mk

post-extract:
	${CHMOD} -R u+w ${WRKSRC}

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/bin
	${INSTALL_DATA_DIR} ${PREFIX}/include
	${INSTALL_PROGRAM} ${WRKSRC}/EVaComm2.dll ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/EVaComm2.lib ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/EVaRT2.h ${PREFIX}/include
