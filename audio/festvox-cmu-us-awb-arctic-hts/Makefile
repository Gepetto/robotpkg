# robotpkg Makefile for:	audio/festvox-cmu-us-awb-arctic-hts
# Created:			Anthony Mallet on Wed, 7 May 2008
#

DISTNAME=		festvox_cmu_us_awb_arctic_hts
PKGNAME=		festvox-cmu-us-awb-arctic-hts-20041209
CATEGORIES=		audio
MASTER_SITES=		http://festvox.org/packed/festival/1.96/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://festvox.org/index.html
COMMENT=		CMU ARCTIC voice by AWB
LICENSE=		modified-bsd

WRKSRC=			${WRKDIR}/festival
NO_BUILD=		yes

include ../../audio/festival/depend.mk
include ../../audio/festlex-cmu/depend.mk
include ../../audio/festlex-poslex/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/robotpkg.mk

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/festival
	cd ${WRKSRC} && ${PAX} -rw . ${PREFIX}/share/festival/.
