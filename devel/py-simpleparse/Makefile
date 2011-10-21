# robotpkg Makefile for:	devel/py-simpleparse
# Created:			Anthony Mallet on Thu, 9 Sep 2010
#

PKGVERSION=		2.1.1a2
PKGREVISION=		1
PKGNAME=		${PKGTAG.python-}simpleparse-${PKGVERSION}
DISTNAME=		SimpleParse-${PKGVERSION_NOREV}
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=simpleparse/}

CATEGORIES=		devel
COMMENT=		Python simple and fast parser generator
HOMEPAGE=		http://simpleparse.sourceforge.net/
MAINTAINER=		tmoulard@laas.fr
LICENSE=		isc

CONFLICTS+=		py-simpleparse-[0-9]*

PYDISTUTILSPKG=		yes
PYSETUPINSTALLARGS=     --single-version-externally-managed
PYSETUPINSTALLARGS+=    --root=/

DEPEND_ABI.python=	python<3

include ../../mk/sysdep/py-setuptools.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk

post-install: python-compile-all(${PREFIX}/${PYTHON_SITELIB}/simpleparse)
