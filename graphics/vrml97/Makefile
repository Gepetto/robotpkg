# robotpkg Makefile for:	graphics/vrml97
# Created:			Anthony Mallet on Wed, 10 Jan 2007
#

DISTNAME=		vrml97
PKGNAME=		vrml97-1.0

CATEGORIES=		graphics
MASTER_SITES=		${MASTER_SITE_ROBOTPKG}
EXTRACT_SUFX=		.jar

MAINTAINER=		openrobots@laas.fr
COMMENT=		Sun's Java 3D(tm) loader for VRML97 models. #'

DEPENDS+=		sun-java3d>=1.4:../../devel/sun-java3d
JAVA_HOME=		${LOCALBASE}/java/sun-1.4

EXTRACT_ONLY=		#empty
NO_CONFIGURE=		yes
NO_BUILD=		yes

include ../../pkgtools/install-sh/depend.mk
include ../../mk/robotpkg.mk


do-install:
	${INSTALL_DATA} ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} ${JAVA_HOME}/lib/ext
