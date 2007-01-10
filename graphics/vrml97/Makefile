# Copyright (c) 2006 LAAS/CNRS                         -- Fri Dec  8 2006
# All rights  reserved.
#

DISTNAME=		vrml97
PKGNAME=		vrml97-1.0

CATEGORIES=		graphics
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
EXTRACT_SUFX=		.jar

MAINTAINER=		openrobots@laas.fr
COMMENT=		Sun's Java 3D(tm) loader for VRML97 models. #'

DEPENDS+=		sun-java3d>=1.4:../../devel/sun-java3d
JAVA_HOME=		${LOCALBASE}/java/sun-1.4

EXTRACT_ONLY=		#empty
NO_CONFIGURE=		yes
NO_BUILD=		yes

include ../../mk/robotpkg.mk


do-install:
	${INSTALL_DATA} ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} ${JAVA_HOME}/lib/ext
