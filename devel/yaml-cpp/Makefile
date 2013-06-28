# robotpkg Makefile for:	devel/mkdep
# Created:			Anthony Mallet on Sun, 28 Jan 2007
#

DISTNAME=		yaml-cpp-0.3.0
CATEGORIES=		devel
MASTER_SITES=		ftp://ftp.FreeBSD.org/pub/FreeBSD/ports/distfiles/

# The original MASTER_SITES= http://yaml-cpp.googlecode.com/files/
# has intermittent error 404 with HEAD http requests.

COMMENT=		YAML parser and emitter for C++
HOMEPAGE=		http://code.google.com/p/yaml-cpp/
LICENSE=		mit
MAINTAINER=		openrobots@laas.fr

WRKSRC=			${WRKDIR}/${PKGBASE}
CMAKE_ARGS+=		-DBUILD_SHARED_LIBS=ON

include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
