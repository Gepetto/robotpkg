# $NetBSD: Makefile,v 1.34 2006/12/28 11:51:11 joerg Exp $

CATEGORIES=	lang
EXTRACT_SUFX=	.jar

DISTNAME=	jython_Release_2_2alpha1
PKGNAME=	jython-2.2a1

COMMENT=	Implementation of the Python language written in Java.

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.jython.org
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=jython/}


DEPENDS+=	sun-jdk14>=2.9:../../lang/sun-jdk14

JYTHON_HOME=	${LOCALBASE}/java/jython

include ../../mk/robotpkg.mk

WRKSRC=		${WRKDIR}/jython

do-extract:
	${MKDIR} -p ${WRKSRC}
	cd ${WRKSRC} && ${PREFIX}/bin/jar-sun14 xf ${DISTDIR}/${DISTNAME}.jar

do-build:
	@${SED} 						\
		-e 's|@PREFIX@|${PREFIX}|g' 			\
		-e 's|@JYTHON_HOME@|${JYTHON_HOME}|g' 		\
		< ${FILESDIR}/jython > ${WRKSRC}/jython
	@${SED} 						\
		-e 's|@JYTHON_HOME@|${JYTHON_HOME}|g' 		\
		< ${FILESDIR}/jythonc > ${WRKSRC}/jythonc

do-install:
	${INSTALL_PROGRAM_DIR} ${JYTHON_HOME}
	cd ${WRKSRC} && ${PAX} -rwp ma . ${JYTHON_HOME}
	${INSTALL_PROGRAM} ${WRKSRC}/jython ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/jythonc ${PREFIX}/bin
