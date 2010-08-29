# robotpkg Makefile for:	devel/sun-jmf
# Created:			Anthony Mallet on Fri, 5 Jan 2007
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
include ../../pkgtools/pax/depend.mk
include ../../pkgtools/install-sh/depend.mk
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
