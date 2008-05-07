# $Id:$
#

DISTNAME=		festlex_POSLEX
PKGNAME=		festlex-poslex-1.96
CATEGORIES=		audio
MASTER_SITES=		http://festvox.org/packed/festival/latest/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://festvox.org/index.html
COMMENT=		English lexicon suitable for use with Festival

WRKSRC=			${WRKDIR}/festival
NO_BUILD=		yes

include ../../audio/festival/depend.mk
include ../../mk/robotpkg.mk

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/festival
	cd ${WRKSRC} && ${PAX} -rw . ${PREFIX}/share/festival/.
