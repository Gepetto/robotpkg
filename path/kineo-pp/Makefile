# Copyright (c) 2006 LAAS/CNRS                         -- Sat Dec  9 2006
# All rights  reserved.
#

KPPVERSION=		2.03
PKGNAME=		kineo-pp-${KPPVERSION}
DISTNAME=		prKpp-${KPPVERSION}
EXTRACT_SUFX=		.tgz

WRKSRC=			${WRKDIR}/kpp-${KPPVERSION}

CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.kineocam.org/
COMMENT=		Software component dedicated to motion planning.

LICENSE=                kineocam-license

INTERACTIVE_STAGE=	fetch
FETCH_MESSAGE+= " The file ${DISTNAME}${EXTRACT_SUFX} containing KineoWorks ${KPPVERSION}"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " must be put manually into:"
FETCH_MESSAGE+= "       ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}"

DEPENDS+=       wxGTK>=2.6.3:../../graphics/wxGTK
DEPENDS+=       boost>=1.33.1:../../devel/boost

include ../../mk/robotpkg.mk

do-install:
	cd ${WRKSRC} && cd KineoPathPlanner/bin/i386-linux 	&& \
	${INSTALL_PROGRAM} KineoPathPlanner ${PREFIX}/bin	&& \
	${INSTALL_LIB} *.so ${PREFIX}/lib
	${INSTALL_DATA_DIR} ${PREFIX}/include/kineo
	${INSTALL_DATA_DIR} ${PREFIX}/share/kineo
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/kineo
	${PAX} -rw -pm -s '|.*/interfaces||' ${WRKSRC}/*/interfaces ${PREFIX}/include/kineo
	${PAX} -rw -pm -s '|.*/res/|res/|' ${WRKSRC}/KineoPathPlanner/bin/i386-linux/res/*.bmp ${PREFIX}/share/kineo
	${PAX} -rw -pm -s '|.*/html||' ${WRKSRC}/Documentation/html ${PREFIX}/share/doc/kineo

