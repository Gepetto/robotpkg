#
# Copyright (c) 2008-2010 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
#                                      Anthony Mallet on Sun May 18 2008
#

DISTNAME=		voice_as_di_2.3
PKGNAME=		ogi-voice_as_diphone-2.3
CATEGORIES=		audio
MASTER_SITES=		http://www.cslu.ogi.edu/tts/download/data/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://cslu.cse.ogi.edu/tts/
COMMENT=		American female diphone voice for Festival
LICENSE=		ohsu-license

RESTRICTED=		Redistribution of repackaged binaries not permitted
NO_PUBLIC_SRC=		${RESTRICTED}
NO_PUBLIC_BIN=		${RESTRICTED}

WRKSRC=			${WRKDIR}/festival
NO_BUILD=		yes

INTERACTIVE_STAGE=	fetch
FETCH_MESSAGE+= " The file"
FETCH_MESSAGE+=	"		${DISTFILES}"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " must be put manually into:"
FETCH_MESSAGE+= "		${DISTDIR}/"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= "You can fetch the file from the following URL:"
FETCH_MESSAGE+= "	${MASTER_SITES}${DISTFILES}"
FETCH_MESSAGE+= "You will have to enter your e-mail address and"	\
		"follow the instructions."
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= "See the following URL for more details:"
FETCH_MESSAGE+= "	${HOMEPAGE}"

include ../../audio/festival/depend.mk
include ../../audio/OGIlexicon/depend.mk
include ../../audio/festlex-poslex/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../mk/robotpkg.mk

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/festival
	cd ${WRKSRC} && ${PAX} -rw . ${PREFIX}/share/festival/.
