# $LAAS: Makefile 2008/10/23 00:10:48 tho $
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
#                                      Anthony Mallet on Mon Oct  6 2008
#

VERSION=		3.0.1.20080922
DISTNAME=		hrpsys-hrp2jrl_3.0.1_ub804_20080922_i386
PKGNAME=		hrpsys-jrl-${VERSION}

CATEGORIES=		architecture
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MAINTAINER=		openrobots@laas.fr
COMMENT=		HRP2 Controller for OpenHRP3

WRKSRC=			${WRKDIR}/OpenHRP
EXTRACT_DIR=		${WRKSRC}
EXTRACT_SUFX=		.tgz

RESTRICTED=		Redistribution of repackaged binaries not permitted
NO_PUBLIC_SRC=		${RESTRICTED}
NO_PUBLIC_BIN=		${RESTRICTED}

INTERACTIVE_STAGE=	fetch
FETCH_MESSAGE+= " The file"
$(foreach __file__,${DISTFILES},$(eval FETCH_MESSAGE+="	${__file__}"))
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " must be put manually into:"
FETCH_MESSAGE+= "       ${DISTDIR}/"

NO_CONFIGURE=		yes
PREFIX=			${LOCALBASE}/OpenHRP

MESSAGE_SUBST+=		PREFIX.OpenHRP="${PREFIX.OpenHRP}"

# we need g++>=4.2
include ../../lang/gcc42-c++/depend.mk

include ../../math/blas/depend.mk
include ../../architecture/openhrp/depend.mk
include ../../mk/robotpkg.mk

do-build:
	${CAT} ${PREFIX.OpenHRP}/bin/unix/config.sh > ${WRKSRC}/bin/unix/config.sh
	${CAT} ${PREFIX.OpenHRP}/bin/unix/FixEnvironment.sh > ${WRKSRC}/bin/unix/FixEnvironment.sh
	${ECHO} export ROBOT=HRP2JRL >> ${WRKSRC}/bin/unix/config.sh
	${ECHO} export ORBscanGranularity=0 >> ${WRKSRC}/bin/unix/config.sh
	${ECHO} export ROBOT=HRP2JRL >> ${WRKSRC}/bin/unix/FixEnvironment.sh

do-install:
	cd ${WRKSRC} && ${PAX} -rwp ma . ${PREFIX}
	${LN} -sf ${PREFIX.blas}/lib/libblas.so ${PREFIX}/lib/libblas.so.3
	${LN} -sf ${PREFIX.gcc42-c++}/lib/libstdc++.so ${PREFIX}/lib/libstdc++.so.6
