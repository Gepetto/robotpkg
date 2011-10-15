# robotpkg Makefile for:	sysutils/tth
# Created:			Anthony Mallet on Tue, 13 Jan 2009
#

DISTNAME=		tth_C
PKGNAME=		tth-3.86
CATEGORIES=		sysutils
MASTER_SITES=		http://hutchinson.belmont.ma.us/tth/tth-noncom/
EXTRACT_SUFX=		.tgz

COMMENT=		TeX to HTML translator
HOMEPAGE=		http://hutchinson.belmont.ma.us/tth/
LICENSE=		isc
MAINTAINER=		openrobots@laas.fr

DOCDIR=			${PREFIX}/share/doc/tth
INSTALLATION_DIRS=	bin ${PKGMANDIR}/man1 ${DOCDIR}

include ../../pkgtools/install-sh/depend.mk
include ../../mk/robotpkg.mk

do-build:
	cd ${WRKSRC} && ${CC} ${CPPFLAGS} ${CFLAGS} -o tth tth.c ${LDFLAGS}

do-install:
	cd ${WRKSRC} && {						\
		${INSTALL_PROGRAM} tth ${PREFIX}/bin;			\
		${INSTALL_PROGRAM} latex2gif ${PREFIX}/bin;		\
		${INSTALL_PROGRAM} ps2gif ${PREFIX}/bin;		\
		${INSTALL_PROGRAM} ps2png ${PREFIX}/bin;		\
		${INSTALL_DATA} tth.1 ${PREFIX}/${PKGMANDIR}/man1;	\
		${INSTALL_DATA} tth_manual.html ${DOCDIR};		\
		${INSTALL_DATA} tth.gif ${DOCDIR};			\
	}
