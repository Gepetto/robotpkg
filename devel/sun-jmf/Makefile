# $NetBSD: Makefile,v 1.34 2006/12/28 11:51:11 joerg Exp $

CATEGORIES=	devel
EXTRACT_SUFX=	.bin

DISTNAME=	jmf-2_1_1e-linux-i586
PKGNAME=	sun-jmf-2.1.1e
MASTER_SITES=	# empty

COMMENT=	Sun's Java Java Media Framework API #'

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://java.sun.com/products/java-media/jmf
DOWNLOAD=	http://java.sun.com/products/java-media/jmf/2.1.1/download.html

DEPENDS+=	sun-jdk14>=2.9:../../lang/sun-jdk14

WRKSRC=		${WRKDIR}/JMF-2.1.1e

LICENSE=	jmf-license

INTERACTIVE_STAGE=	fetch

include ../../mk/robotpkg.prefs.mk

JAVA_HOME=	${LOCALBASE}/java/sun-1.4

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

do-build:	# nothing
	@${TRUE}

do-install:
	${INSTALL_PROGRAM_DIR} ${JAVA_HOME}
	cd ${WRKSRC} && ${PAX} -rwp ma . ${JAVA_HOME}
