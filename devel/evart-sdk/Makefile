# $LAAS: Makefile 2008/07/15 16:45:24 mallet $
#
# Copyright (c) 2008 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
#                                      Anthony Mallet on Thu Jul  3 2008
#

VERSION=		1.0.1
DISTNAME=		EVaRT_SDK2_${VERSION}
PKGNAME=		evart-sdk-${VERSION}

CATEGORIES=		devel
MASTER_SITES=

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.motionanalysis.com/html/industrial/evart.html
COMMENT=		EVa Real-Time Software Development Kit.

PREFIX?=			${LOCALBASE}/i386-mingw32
WRKSRC=			${WRKDIR}/SDK2_v${VERSION}

LICENSE=                motion-analysis-license
RESTRICTED=             You cannot redistribute this software.
NO_PUBLIC_SRC=          ${RESTRICTED}
NO_PUBLIC_BIN=          ${RESTRICTED}

INTERACTIVE_STAGE=      fetch
FETCH_MESSAGE+= " The file ${DISTNAME}${EXTRACT_SUFX} containing EVaRT_SDK2 ${VERSION}"
FETCH_MESSAGE+= " must be put manually into:"
FETCH_MESSAGE+= "       ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " In order to obtain this file, contact your local system administrator."

NO_CONFIGURE=		yes
NO_BUILD=		yes

include ../../mk/robotpkg.mk

post-extract:
	${CHMOD} -R u+w ${WRKSRC}

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/bin
	${INSTALL_DATA_DIR} ${PREFIX}/include
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/EVaRT-SDK
	${INSTALL_PROGRAM} ${WRKSRC}/EVaComm2.dll ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/EVaComm2.lib ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/EVaRT2.h ${PREFIX}/include
	${INSTALL_DATA} ${WRKSRC}/ReadMe.txt ${PREFIX}/share/doc/EVaRT-SDK
