# Copyright (c) 2006 LAAS/CNRS                         -- Sat Dec  9 2006
# All rights  reserved.
#

KPPVERSION=		2.03
PKGNAME=		kineo-pp-${KPPVERSION}
DISTNAME=		prKpp-${KPPVERSION}
EXTRACT_SUFX=		.tgz

CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.kineocam.org/
COMMENT=		Software component dedicated to motion planning.

INTERACTIVE_STAGE=	fetch

FETCH_MESSAGE+= " The file ${DISTNAME}${EXTRACT_SUFX} containing KineoWorks ${KPPVERSION}"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " must be put manually into:"
FETCH_MESSAGE+= "       ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " In order to get KineoWorks, you should contact:"
FETCH_MESSAGE+= "       KineoCam (http://www.kineocam.com)"

include ../../mk/robotpkg.mk
