# robotpkg Makefile for:	localization/pom-genom
# Created:			Anthony Mallet on Tue, 20 Nov 2007
#

DISTNAME=		pom-genom-0.7
CATEGORIES=		localization

MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=pom-genom/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}pom-genom

MAINTAINER=		openrobots@laas.fr
COMMENT=		GenoM module for localization management.
LICENSE=		2-clause-bsd

NOT_FOR_PLATFORM=
GENOM_MODULE=		pom

define PKG_OPTION_UNSET.api
  include ../../localization/insitu/depend.mk
  include ../../localization/libpom/depend.mk
endef
include ../../math/t3d/depend.mk
include ../../architecture/genom/depend.mk
include ../../mk/robotpkg.mk
