# $LAAS: Makefile 2009/01/27 11:50:38 mallet $
#
# Copyright (c) 2008-2009 LAAS/CNRS
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
