# robotpkg Makefile for:	localization/GPS-genom
# Created:			Arnaud Degroote on Tue, 20 May 2008
#

DISTNAME=		GPS-genom-${VERSION}
VERSION=		1.5
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}GPS-genom

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for GPS management

LICENSE=		isc

GNU_CONFIGURE=		yes

GENOM_MODULE=		GPS
include ../../architecture/genom/depend.mk

include ../../interfaces/genBasic-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../hardware/GPSNovatel/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
