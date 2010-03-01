#
# Copyright (c) 2008-2010 LAAS/CNRS
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
#                                      Anthony Mallet on Mon Oct  6 2008
#

VERSION=		3.0.1.20080922
DISTNAME=		hrpsys-hrp2jrl_3.0.1_ub804_20080922_i386
PKGNAME=		hrpsys-jrl-${VERSION}

CATEGORIES=		architecture
MASTER_SITES=		# non-free
MAINTAINER=		openrobots@laas.fr
COMMENT=		HRP2 Controller for OpenHRP3
LICENSE=		openhrp-grx-license

WRKSRC=			${WRKDIR}/OpenHRP
EXTRACT_DIR=		${WRKSRC}
EXTRACT_SUFX=		.tgz

RESTRICTED=		Redistribution of repackaged binaries not permitted
NO_PUBLIC_SRC=		${RESTRICTED}
NO_PUBLIC_BIN=		${RESTRICTED}

INTERACTIVE_STAGE=	fetch
FETCH_MESSAGE+= " The file: ${DISTNAME}${EXTRACT_SUFX}"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " must be put manually into:"
FETCH_MESSAGE+= "       ${DISTDIR}/"

NO_CONFIGURE=		yes
PREFIX=			${LOCALBASE}/OpenHRP
INSTALLATION_DIRS+=	lib

MESSAGE_SUBST+=		PREFIX.OpenHRP="${PREFIX.OpenHRP}"

SUBST_CLASSES+=			hrpsys-paths
SUBST_STAGE.hrpsys-paths=	pre-build
SUBST_MESSAGE.hrpsys-paths=	Fixing installation directories.
SUBST_SED.hrpsys-paths=		-e 's|@PREFIX@|${PREFIX}|g'
SUBST_FILES.hrpsys-paths=\
	Controller/IOserver/robot/HRP2JRL/bin/HRP2Controller.sh

# we need g++>=4.2
USE_LANGUAGES+=	c++
GCC_REQUIRED+=	>=4.2

include ../../math/blas/depend.mk
include ../../architecture/openhrp/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../mk/robotpkg.mk

do-build:
	${CAT} ${PREFIX.OpenHRP}/bin/unix/config.sh > ${WRKSRC}/bin/unix/config.sh
	${CAT} ${PREFIX.OpenHRP}/bin/unix/FixEnvironment.sh > ${WRKSRC}/bin/unix/FixEnvironment.sh
	${ECHO} export ROBOT=HRP2JRL >> ${WRKSRC}/bin/unix/config.sh
	${ECHO} export ORBscanGranularity=0 >> ${WRKSRC}/bin/unix/config.sh
	${ECHO} export ROBOT=HRP2JRL >> ${WRKSRC}/bin/unix/FixEnvironment.sh

do-install:
	cd ${WRKSRC} && ${PAX} -rwp ma . ${PREFIX}
	${ECHO} "Replace this file with a valid license"	\
		> ${PREFIX}/bin/unix/license.dat
	${LN} -sf ${PREFIX.blas}/lib/libblas.so ${PREFIX}/lib/libblas.so.3
	${LN} -sf `${CXX} -print-file-name=libstdc++.so` ${PREFIX}/lib/libstdc++.so.6
