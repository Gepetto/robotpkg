# robotpkg Makefile for:	sysutils/py-aafigure
# Created:			Anthony Mallet on Mon, 26 Nov 2012
#

VERSION=		0.5
PKGNAME=		${PKGTAG.python}-aafigure-${VERSION}
DISTNAME=		aafigure-${VERSION}
MASTER_SITES=		http://pypi.python.org/packages/source/a/aafigure/

CATEGORIES=		sysutils
COMMENT=		ASCII art to image converter
HOMEPAGE=		https://launchpad.net/aafigure
MAINTAINER=		mallet@laas.fr
LICENSE=		modified-bsd

PYDISTUTILSPKG=		yes
SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	scripts/aafigure

DEPEND_ABI.python=	python<3

include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
