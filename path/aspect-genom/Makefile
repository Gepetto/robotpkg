# robotpkg Makefile for:	path/aspect-genom
# Created:			Arnaud Degroote on Tue, 10 Jun 2008
#

DISTNAME=		aspect-genom-0.1
CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Aspect map on the base of laser data

GNU_CONFIGURE=		yes

GENOM_MODULE=		aspect
include ../../architecture/genom/depend.mk

include ../../localization/segloc-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../hardware/sick-genom/depend.mk
include ../../mapping/mapkit/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
