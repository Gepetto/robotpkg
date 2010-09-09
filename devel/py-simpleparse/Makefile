# robotpkg Makefile for:	devel/py-simpleparse
# Created:			Anthony Mallet on Thu, 9 Sep 2010
#

PKGVERSION=		2.1.1a2
PKGNAME=		py-simpleparse-${PKGVERSION}
DISTNAME=		SimpleParse-${PKGVERSION}
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=simpleparse/}

CATEGORIES=		devel
COMMENT=		Python simple and fast parser generator
HOMEPAGE=		http://simpleparse.sourceforge.net/
MAINTAINER=		tmoulard@laas.fr
LICENSE=		isc

USE_LANGUAGES=		c python
PYDISTUTILSPKG=		yes
PYSETUPINSTALLARGS=     --single-version-externally-managed
PYSETUPINSTALLARGS+=    --root=/

include ../../mk/sysdep/py-setuptools.mk
include ../../mk/robotpkg.mk
