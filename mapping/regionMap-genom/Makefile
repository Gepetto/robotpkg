# robotpkg Makefile for:	mapping/regionMap-genom
# Created:			Arnaud Degroote on Fri, 28 Jan 2011
#

DISTNAME=		regionMap-genom-0.3
PKGREVISION=	2
CATEGORIES=		mapping
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=regionMap-genom/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/regionMap-genom

MAINTAINER=		openrobots@laas.fr
COMMENT=		Traversability Map Construction  - GenoM component
LICENSE=		2-clause-bsd

GNU_CONFIGURE=		yes

GENOM_MODULE=		regionMap
include ../../architecture/genom/depend.mk

define PKG_OPTION_UNSET.api
  include ../../mapping/regionMap-lib/depend.mk
  include ../../math/t3d/depend.mk
endef

include ../../hardware/velodyne-genom/depend.mk
include ../../image/stereopixel-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
