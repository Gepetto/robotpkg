# robotpkg Makefile for:	wip/py-poco
# Created:			Séverin Lemaignan on Tue, 9 Aug 2011
#

VERSION=		1.5
PKGNAME=		${PKGTAG.python}-poco-${VERSION}
DISTNAME=		pypoco-${VERSION}
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=pypoco/}
MASTER_REPOSITORY=	git git://git.openrobots.org/git/robots/pypoco

CATEGORIES=		net
LICENSE=		isc
MAINTAINER=		openrobots@laas.fr
COMMENT=		Python bindings for the tclserv protocol

DEPEND_ABI.python+=	python<3
PYDISTUTILSPKG=		yes
NO_CONFIGURE=		yes

include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
