# robotpkg Makefile for:	knowledge/py-oro
# Created:			Séverin Lemaignan on Fri, 5 Aug 2011
#

PKGVERSION=		1.0
PKGNAME=		${PKGTAG.python}-oro-${PKGVERSION}
DISTNAME=		pyoro-${PKGVERSION_NOREV}
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=pyoro/}
MASTER_REPOSITORY=	git http://softs.laas.fr/git/robots/pyoro.git

CATEGORIES=		knowledge
COMMENT=		Python bindings for knowledge/oro-server
HOMEPAGE=		http://oro.openrobots.org
LICENSE=		2-clause-bsd
MAINTAINER=		openrobots@laas.fr

USE_LANGUAGES=
NO_CONFIGURE=		yes

DEPEND_ABI.python+=	python<3
PYDISTUTILSPKG=		yes
include ../../mk/sysdep/python.mk

include ../../mk/robotpkg.mk

post-install: python-compile-file(${PREFIX}/${PYTHON_SITELIB}/pyoro.py)
