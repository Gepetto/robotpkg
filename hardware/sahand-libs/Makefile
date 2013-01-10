# robotpkg Makefile for:	hardware/sahand-libs
# Created:			Matthieu Herrb on Thu, 10 Jun 2010
#
VERSION=	08.08.14
PKGNAME=	sahand-libs-${VERSION}
DISTNAME=	sahapi_$(subst .,,${VERSION})
PKGREVISION=	1
CATEGORIES=	hardware

COMMENT=	Schunk Antropomorphic Hand API
LICENSE=	sahand-license
MAINTAINER=	openrobots@laas.fr

RESTRICTED=	You cannot redistribute this software.
NO_PUBLIC_SRC=	${RESTRICTED}
NO_PUBLIC_BIN=	${RESTRICTED}

INTERACTIVE_STAGE=	fetch

INSTALLATION_DIRS+= include/sahand
INSTALLATION_DIRS+= share/doc/sahand

include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

pre-build:
	$(RM) -f $(WRKSRC)/libsahand.so

do-install:
	(cd $(WRKSRC); $(INSTALL_DATA) SAHandCtrlApi.h \
		CY9449.h DLRHITDpr.h SAHandCtrlApiDef.h \
		${PREFIX}/include/sahand)
	(cd $(WRKSRC); $(INSTALL_DATA) libsahand.so ${PREFIX}/lib)
	(cd $(WRKSRC); $(INSTALL_DATA) Hand_Manual.pdf \
		${PREFIX}/share/doc/sahand )
