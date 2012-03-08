# robotpkg Makefile for:	speech/dialogs
# Created:			Séverin Lemaignan on Wed, 9 Feb 2011
#

DISTNAME=		dialogs-${PKGVERSION_NOREV}
PKGVERSION=		0.6
PKGREVISION=		1

MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=dialogs/}
MASTER_REPOSITORY=	git http://trac.laas.fr/git/robots/dialogs.git

CATEGORIES=		speech
LICENSE=		2-clause-bsd
MAINTAINER=		slemaign@laas.fr
COMMENT=		Natural language processor for human-robot interaction

CONFLICTS+=		py[0-9][0-9]-dialogs-[0-9]*

PYDISTUTILSPKG=		yes

# Replace python interpreter
SUBST_CLASSES+=		rpython
SUBST_STAGE.rpython=	pre-configure
SUBST_MESSAGE.rpython=	Fixing python interpreter path in python scripts
SUBST_FILES.rpython=	share/examples/dialogs/scenario_moving.py
SUBST_SED.rpython=	-e '1s|^\\\#!.*python[0-9.]*|\\\#!${PYTHON}|'

DEPEND_ABI.python=	python>=2.5<3
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
