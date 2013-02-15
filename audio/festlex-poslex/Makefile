# robotpkg Makefile for:	audio/festlex-poslex
# Created:			Anthony Mallet on Wed, 7 May 2008
#

DISTNAME=		festlex_POSLEX
PKGNAME=		festlex-poslex-1.96
CATEGORIES=		audio
MASTER_SITES=		http://festvox.org/packed/festival/1.96/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://festvox.org/index.html
COMMENT=		English lexicon suitable for use with Festival
LICENSE=		modified-bsd

WRKSRC=			${WRKDIR}/festival
NO_BUILD=		yes

include ../../audio/festival/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/festival
	cd ${WRKSRC} && ${PAX} -rw . ${PREFIX}/share/festival/.
