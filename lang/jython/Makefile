# robotpkg Makefile for:	lang/jython
# Created:			Anthony Mallet on Fri, 5 Jan 2007
#

VERSION=	2.2.1
DISTNAME=	jython_installer-${VERSION}
PKGNAME=	jython-${VERSION}
EXTRACT_SUFX=	.jar

CATEGORIES=	lang

COMMENT=	Implementation of the Python language written in Java.

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.jython.org
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=jython/}

JYTHON_HOME=	${LOCALBASE}/java/jython

WRKSRC=		${WRKDIR}/extract
NO_CONFIGURE=	yes
NO_BUILD=	yes

include ../../lang/sun-jdk6/depend.mk
include ../../lang/sun-jre6/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../mk/robotpkg.mk

do-extract:
	${MKDIR} -p ${WRKSRC}
	cd ${WRKSRC} && ${JAVA_HOME}/bin/jar xf ${DISTDIR}/${DISTNAME}.jar

post-extract:
	@${SED} 						\
		-e 's|@JAVA_HOME@|${JAVA_HOME}|g' 		\
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
