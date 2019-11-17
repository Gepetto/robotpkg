# robotpkg Makefile for:	net/evart-client
# Created:			Anthony Mallet on Tue, 15 Jul 2008
#

VERSION=		2.2
DISTNAME=		evart-client-${VERSION}

CATEGORIES=		net
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=evart/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS_TRAC}evart-client

MAINTAINER=		mallet@laas.fr
HOMEPAGE=		http://homepages.laas.fr/mallet/soft/mocap/evart-client
COMMENT=		EVa Real-Time Software data streaming API.
LICENSE=		2-clause-bsd

GNU_CONFIGURE=		yes
DYNAMIC_PLIST_DIRS+=	share/doc/evart-client

include ../../mk/sysdep/doxygen.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
