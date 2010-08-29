# robotpkg Makefile for:	sysutils/tth
# Created:			Anthony Mallet on Tue, 13 Jan 2009
#

PKGNAME=		tth-3.86
DISTNAME=		tth_C
EXTRACT_SUFX=		.tgz

COMMENT=		TeX to HTML translator

MAINTAINER=		openrobots@laas.fr
CATEGORIES=		sysutils
HOMEPAGE=		http://hutchinson.belmont.ma.us/tth/
MASTER_SITES=		http://hutchinson.belmont.ma.us/tth/tth-noncom/

DOCDIR=			${PREFIX}/share/doc/tth

include ../../pkgtools/install-sh/depend.mk
include ../../mk/robotpkg.mk

do-build:
	cd ${WRKSRC} && ${CC} ${CPPFLAGS} ${CFLAGS} -o tth tth.c ${LDFLAGS}

do-install:
	cd ${WRKSRC} && { 						\
		${INSTALL_PROGRAM} tth ${PREFIX}/bin;			\
		${INSTALL_PROGRAM} latex2gif ${PREFIX}/bin;		\
		${INSTALL_PROGRAM} ps2gif ${PREFIX}/bin;		\
		${INSTALL_PROGRAM} ps2png ${PREFIX}/bin;		\
		${INSTALL_DATA_DIR} ${PREFIX}/${PKGMANDIR}/man1;	\
		${INSTALL_DATA} tth.1 ${PREFIX}/${PKGMANDIR}/man1;	\
		${INSTALL_DATA_DIR} ${DOCDIR};				\
		${INSTALL_DATA} tth_manual.html ${DOCDIR};		\
		${INSTALL_DATA} tth.gif ${DOCDIR};			\
	}
