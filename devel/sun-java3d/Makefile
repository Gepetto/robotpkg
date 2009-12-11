# $NetBSD: Makefile,v 1.34 2006/12/28 11:51:11 joerg Exp $

CATEGORIES=	devel
EXTRACT_SUFX=	.bin

DISTNAME=	java3d-1_5_1-linux-i586
PKGNAME=	sun-java3d-1.5.1
MASTER_SITES=	# empty

COMMENT=	Sun's Java 3D(TM) API #'

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://java.sun.com/products/java-media/3D
DOWNLOAD=	http://java.sun.com/products/java-media/3D/downloads/index.html

WRKSRC=		${WRKDIR}

LICENSE=	sun-java3d-license

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

NO_BUILD=	yes

include ../../lang/sun-jre6/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../mk/robotpkg.prefs.mk
include ../../mk/robotpkg.mk

post-fetch:
	@if [ ! -x ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} ]; then	\
		${CHMOD} +x ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX};	\
	fi

do-install:
	${INSTALL_PROGRAM_DIR} ${JAVA_HOME}
	cd ${WRKSRC} && ${PAX} -rwp ma lib ${JAVA_HOME}
