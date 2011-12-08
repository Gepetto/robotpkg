# robotpkg Makefile for:	speech/gspeett
# Created:			Séverin Lemaignan on Wed, 8 Dec 2011
#

DISTNAME=		gspeett-${PKGVERSION_NOREV}
PKGVERSION=		1.2
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=gspeett/}
MASTER_REPOSITORY=	git git://git.openrobots.org/robots/gspeett

CATEGORIES=		speech
LICENSE=		2-clause-bsd
MAINTAINER=		slemaign@laas.fr
COMMENT=		Python client for the Google Speech-To-Text API

PYDISTUTILSPKG=		yes

DEPEND_ABI.python=	python>=2.5<3

include ../../mk/sysdep/py-pyaudio.mk
include ../../mk/sysdep/speex.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk

post-install: python-compile-all(${PREFIX}/${PYTHON_SITELIB}/gspeett)
