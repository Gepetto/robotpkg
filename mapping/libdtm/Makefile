# robotpkg Makefile for:	mapping/libdtm
# Created:			Arnaud Degroote on Thu, 6 Aug 2009
#

DISTNAME=		libdtm-${VERSION}
VERSION=		1.4.1
CATEGORIES=		mapping
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Digital Terrain Modeling lib

GNU_CONFIGURE=		yes

AUTORECONF_SCRIPT=     ${WRKSRC}/autogen.sh

include ../../graphics/gdhe/depend.mk
include ../../image/libimages3d/depend.mk
include ../../math/t3d/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
