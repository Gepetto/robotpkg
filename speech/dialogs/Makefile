# robotpkg Makefile for:	speech/dialogs
# Created:			Séverin Lemaignan on Wed, 9 Feb 2011
#

DISTNAME=	    	dialogs-${PKGVERSION_NOREV}
PKGTNAME=	    	${PKGTAG.python-}dialogs-${PKGVERSION}
PKGVERSION=	    	0.6

MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=dialogs/}
MASTER_REPOSITORY=	git http://trac.laas.fr/git/robots/dialogs.git

CATEGORIES=		speech
LICENSE=		2-clause-bsd
MAINTAINER=		slemaign@laas.fr
COMMENT=    		Natural language processor for human-robot interaction

CONFLICTS+=		dialogs-[0-9]*
CONFLICTS+=		py[0-9][0-9]-dialogs-[0-9]*

PYDISTUTILSPKG=		yes

DEPEND_ABI.python=	python>=2.5<3
include ../../mk/sysdep/python.mk

include ../../mk/sysdep/py-setuptools.mk
include ../../mk/robotpkg.mk
