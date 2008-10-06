# $LAAS: Makefile 2008/10/05 17:43:10 tho $
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
#                                      Anthony Mallet on Fri Oct  3 2008
#

DISTNAME=	jmf-2_1_1e-linux-i586
PKGNAME=	sun-jmf-2.1.1e
PKGREVISION=	1

CATEGORIES=	devel
EXTRACT_SUFX=	.bin

COMMENT=	Sun's Java Java Media Framework API #'

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://java.sun.com/products/java-media/jmf
DOWNLOAD=	http://java.sun.com/products/java-media/jmf/2.1.1/download.html
MASTER_SITES=	# empty


WRKSRC=		${WRKDIR}/JMF-2.1.1e

LICENSE=	jmf-license

INTERACTIVE_STAGE=	fetch

FETCH_MESSAGE= 								\
	"The file ${DISTNAME}${EXTRACT_SUFX} containing:"		\
	"    ${COMMENT}"						\
	"must be fetched into:" 					\
	"    ${DISTDIR}"						\
	"from:" 							\
	"    ${DOWNLOAD}" 						\
	""								\
	"Click 'API Download', read and accept the"			\
	"license, then choose 'Linux self-extracting file'."

EXTRACT_ENV+=	HOME=${WRKDIR}/fake_home
EXTRACT_CMD=	for a in yes yes no; do echo $$a; done | ${WRKDIR}/${DISTNAME}${EXTRACT_SUFX} >/dev/null

NO_PUBLIC_SRC=	yes
NO_PUBLIC_BIN=	yes
NO_CONFIGURE=	yes
NO_BUILD=	yes

include ../../lang/sun-jre6/depend.mk
include ../../mk/robotpkg.mk

post-fetch:
	@if [ ! -x ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} ]; then	\
		${CHMOD} +x ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX};	\
	fi

do-extract: ${WRKDIR}/${DISTNAME}${EXTRACT_SUFX}

${WRKDIR}/${DISTNAME}${EXTRACT_SUFX}:
	$(SED) -e 's/tail +309/tail -n +309/'				\
		< ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} > $@
	${CHMOD} +x $@;

post-extract:
	${MKDIR} ${WRKSRC}/lib/i386
	${MKDIR} ${WRKSRC}/lib/ext
	${MV} ${WRKSRC}/lib/*.jar ${WRKSRC}/lib/ext
	${MV} ${WRKSRC}/lib/*.so ${WRKSRC}/lib/i386

do-install:
	${INSTALL_PROGRAM_DIR} ${JAVA_HOME}
	cd ${WRKSRC} && ${PAX} -rwp ma . ${JAVA_HOME}
