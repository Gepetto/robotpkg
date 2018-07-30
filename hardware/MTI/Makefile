# robotpkg Makefile for:	hardware/MTI
# Created:			Arnaud Degroote on Thu, 17 Jul 2008
#

DISTNAME=		MTI-${VERSION}
VERSION=		0.6
CATEGORIES=		hardware
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}mti-libs

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Driver and interface for MTI

AUTORECONF_SCRIPT=     ${WRKSRC}/autogen.sh

GNU_CONFIGURE=		yes

include ../../devel/mkdep/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
