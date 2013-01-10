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
FETCH_MESSAGE+=\
  "${bf}The fetch stage of this package requires user interaction${rm}"	\
  "The file ${DISTNAME}${EXTRACT_SUFX} for Cortex SDK2 ${VERSION}"	\
  "must be put manually into:"						\
  "		${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}"			\
  ""									\
  "This file is located on the Cortex CDROM, in the Sdk2 directory."	\
  "For more information, see"						\
  "		${HOMEPAGE}"

NO_CONFIGURE=		yes
NO_BUILD=		yes
INSTALLATION_DIRS=	bin include

include ../../pkgtools/install-sh/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

post-extract:
	${RUN} ${CHMOD} -R u+w ${WRKSRC}

do-install:
	${RUN} ${INSTALL_PROGRAM} ${WRKSRC}/EVaComm2.dll ${PREFIX}/bin
	${RUN} ${INSTALL_DATA} ${WRKSRC}/EVaComm2.lib ${PREFIX}/bin
	${RUN} ${INSTALL_DATA} ${WRKSRC}/EVaRT2.h ${PREFIX}/include
