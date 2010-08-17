# robotpkg Makefile for:	pkgtools/digest
# Created:			Anthony Mallet on Wed, 2 May 2007
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
