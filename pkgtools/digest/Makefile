#
# Copyright (C) 2008,2010 LAAS/CNRS
#
# Authored by Anthony Mallet on Fri Apr 18 2008
# From $NetBSD: Makefile,v 1.52 2006/11/02 18:02:07 joerg Exp $
#
# This version of digest installs into ${PKG_TOOLS_BIN} as robotpkg_digest.
#

DISTNAME?=	digest-${VERSION}
CATEGORIES=	pkgtools
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.NetBSD.org/Documentation/software/packages.html
COMMENT=	Message digest wrapper utility

NO_CHECKSUM=	yes
NOT_FOR_PLATFORM=# empty

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--bindir=${PKG_TOOLS_BIN}
CONFIGURE_ARGS+=	--program-transform-name='s/^/robotpkg_/'

include ../../mk/robotpkg.prefs.mk

VERSION:=	$(shell	${AWK} -F "'" '/^PACKAGE_VERSION=/ {print $$2}' \
			${CURDIR}/dist/configure)

include ../../mk/robotpkg.mk

do-extract:
	@${CP} -Rp ${CURDIR}/dist ${WRKSRC}

do-test:
	@${ECHO} "No news is good news"
	@cd ${WRKSRC} && ${SETENV} DIGESTDIR=${WRKSRC} ${SH} ./regress.sh
	@${ECHO} "All tests completed"
