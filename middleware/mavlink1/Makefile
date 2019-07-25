# robotpkg Makefile for:	middleware/mavlink1
# Created:			Arnaud Degroote on Mon, 16 Dec 2013
#

VERSION=		1.0.12
PKGNAME=		mavlink1-${VERSION}
DISTNAME=		mavlink+submodules-${VERSION}
CATEGORIES=		middleware

# the official archive does not include submodules
MASTER_SITES=           ${MASTER_SITE_OPENROBOTS:=mavlink/}
MASTER_REPOSITORY=	https://github.com/mavlink/mavlink.git

MAINTAINER=		openrobots@laas.fr
COMMENT=		Micro Air Vehicle Message Marshalling Library
LICENSE=		gnu-lgpl-v3

WRKSRC=			${WRKDIR}/mavlink-1.0.12
CMAKE_ARG_PATH=		..
CONFIGURE_DIRS=		build

pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/${CONFIGURE_DIRS}

include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/py-future.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
