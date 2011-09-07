# robotpkg Makefile for:	pkgtools/rbulkit
# Created:			Anthony Mallet on Mon, 19 Sep 2011
#

VERSION=		20110920
DISTNAME?=		rbulkit-${VERSION}
CATEGORIES=		pkgtools
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=rbulkit/}
MASTER_REPOSITORY=	git git://git.openrobots.org/git/robots/rbulkit

COMMENT=		Helper scripts for robotpkg bulk builds
LICENSE=		isc
MAINTAINER=		mallet@laas.fr

NOT_FOR_PLATFORM=	# empty

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	GIT=${GIT}
CONFIGURE_ARGS+=	GMAKE=${MAKE}
CONFIGURE_ARGS+=	TCLSH=${TCLSH}

include ../../mk/sysdep/git.mk
include ../../mk/sysdep/sqlite3.mk
include ../../mk/sysdep/sqlite3-tcl.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/robotpkg.mk
