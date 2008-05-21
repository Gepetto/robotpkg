# $Id:$
#

DISTNAME=		voice_as_di_2.3
PKGNAME=		ogi-voice_as_diphone-2.3
CATEGORIES=		audio
MASTER_SITES=		http://www.cslu.ogi.edu/tts/download/data/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://cslu.cse.ogi.edu/tts/demos/
COMMENT=		American female diphone voice for Festival

WRKSRC=			${WRKDIR}/festival
NO_BUILD=		yes

include ../../audio/festival/depend.mk
include ../../audio/OGIlexicon/depend.mk
include ../../audio/festlex-poslex/depend.mk
include ../../mk/robotpkg.mk

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/festival
	cd ${WRKSRC} && ${PAX} -rw . ${PREFIX}/share/festival/.
