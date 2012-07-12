# robotpkg Makefile for:	lang/jython
# Created:			Anthony Mallet on Fri, 5 Jan 2007
#

VERSION=	2.5.3b1
DISTNAME=	jython_installer-${VERSION}
PKGNAME=	jython-${VERSION}
EXTRACT_SUFX=	.jar

CATEGORIES=	lang

COMMENT=	Implementation of the Python language written in Java.

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.jython.org
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=jython/}
LICENSE=	psfl-v2

JYTHON_HOME=		${PREFIX}/java/jython
INSTALLATION_DIRS+=	${JYTHON_HOME}

WRKSRC=		${WRKDIR}/extract
NO_CONFIGURE=	yes
NO_BUILD=	yes

DEPEND_METHOD.java+=bootstrap

include ../../pkgtools/pax/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/sysdep/java.mk
include ../../mk/robotpkg.mk

do-extract:
	${RUN}${MKDIR} -p ${WRKSRC} && cd ${WRKSRC} &&		\
	${JAR} xf ${DISTDIR}/${DISTNAME}.jar

post-extract:
	@${SED}							\
		-e 's|@JAVA_HOME@|${JAVA_HOME}|g'		\
		-e 's|@JYTHON_HOME@|${JYTHON_HOME}|g'		\
		< ${FILESDIR}/jython > ${WRKDIR}/jython
	@${SED}							\
		-e 's|@JYTHON_HOME@|${JYTHON_HOME}|g'		\
		< ${FILESDIR}/jythonc > ${WRKDIR}/jythonc

do-install:
	${RUN} cd ${WRKSRC} && ${PAX} -rwp ma . ${JYTHON_HOME};	\
	${INSTALL_PROGRAM} ${WRKDIR}/jython ${PREFIX}/bin;	\
	${INSTALL_PROGRAM} ${WRKDIR}/jythonc ${PREFIX}/bin
