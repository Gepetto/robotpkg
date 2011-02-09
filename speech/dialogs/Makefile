# robotpkg Makefile for:	speech/dialogs
# Created:			Séverin Lemaignan on Wed, 9 Feb 2011
#

DISTNAME=	    	dialogs-${PKGVERSION}
PKGVERSION=	    	0.5

MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=dialogs/}
MASTER_REPOSITORY=	git http://trac.laas.fr/git/robots/dialogs.git

CATEGORIES=	speech
LICENSE=	2-clause-bsd
MAINTAINER=	slemaign@laas.fr
COMMENT=    A natural language processor for human-robot interaction

USE_LANGUAGES+=		python
PYTHON_REQUIRED=	>=2.5 <3

PYDISTUTILSPKG=		yes

include ../../mk/sysdep/py-setuptools.mk
include ../../mk/robotpkg.mk

