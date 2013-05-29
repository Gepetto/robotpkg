# robotpkg Makefile for:	mapping/libregionmap
# Created:			Arnaud Degroote on Fri, 28 Jan 2011
#

DISTNAME=		regionMap-lib-${VERSION}
VERSION=		0.4
PKGREVISION= 	2
CATEGORIES=		mapping
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=regionMap-lib/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/regionMap-lib


MAINTAINER=		openrobots@laas.fr
COMMENT=		Traversability Map lib
LICENSE=		2-clause-bsd

GNU_CONFIGURE=		yes

include ../../graphics/gdhe/depend.mk
include ../../image/libimages3d/depend.mk
include ../../math/t3d/depend.mk
include ../../mapping/libdtm/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
