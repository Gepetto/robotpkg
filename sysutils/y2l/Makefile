# robotpkg Makefile for:	sysutils/y2l
# Created:			Anthony Mallet on Fri, 23 Apr 2010
#

PKGNAME=		y2l-1.0
DISTNAME=		y2l

COMMENT=		Yacc to LaTeX translator

MAINTAINER=		openrobots@laas.fr
CATEGORIES=		sysutils
HOMEPAGE=		http://www.alchar.org/~aedil/Projects/y2l.html
MASTER_SITES=		http://y2l.sourceforge.net/download/
LICENSE=		artistic

WRKSRC=			${WRKDIR}/${PKGNAME}
NO_CONFIGURE=		yes
NO_BUILD=		yes

DOCDIR=			share/doc/y2l
INSTALLATION_DIRS=	bin
INSTALLATION_DIRS+=	${PKGMANDIR}/man1
INSTALLATION_DIRS+=	${DOCDIR}

include ../../pkgtools/install-sh/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

do-install:
	cd ${WRKSRC} && { 						\
	  ${INSTALL_PROGRAM} y2l ${PREFIX}/bin/.;			\
	  ${INSTALL_DATA} y2l.man ${PREFIX}/${PKGMANDIR}/man1/y2l.1;	\
	  ${INSTALL_DATA} y2lman.html ${PREFIX}/${DOCDIR}/.;		\
	  ${INSTALL_DATA} README ${PREFIX}/${DOCDIR}/.;			\
	}
