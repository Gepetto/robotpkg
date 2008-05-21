# $Id:$
#

DISTNAME=		OGIlexicon-2.2
CATEGORIES=		audio
MASTER_SITES=		http://www.cslu.ogi.edu/tts/download/data/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://cslu.cse.ogi.edu/tts/demos/
COMMENT=		American English pronunciation lexicon

WRKSRC=			${WRKDIR}/festival
NO_BUILD=		yes

REQD_BUILD_OPTIONS.festival=	ogireslpc
include ../../audio/festival/depend.mk

include ../../mk/robotpkg.mk

do-install:
	cd ${WRKSRC} && ${PAX} -rw . ${PREFIX.festival}/share/festival/.
