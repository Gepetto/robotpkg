# robotpkg Makefile for:	hardware/icub-libs
# Created:			Anthony Mallet on Mon, 11 Dec 2023
#

DISTNAME=		icub-libs-0.1
CATEGORIES=		hardware
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=icub-libs/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS:=/icub-libs}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		https://git.openrobots.org/projects/icub-libs
COMMENT=		Interface library for the iit/icub force/torque sensor
LICENSE=		2-clause-bsd

GNU_CONFIGURE=		yes

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
