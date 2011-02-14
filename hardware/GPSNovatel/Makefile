# robotpkg Makefile for:	hardware/GPSNovatel
# Created:			Anthony Mallet on Tue, 17 Jun 2008
#

PKGNAME=		GPSNovatel-${VERSION}
DISTNAME=		gpsnovatel-${VERSION}
VERSION=		1.5
CATEGORIES=		hardware
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=GPSNovatel-libs/}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/GPSNovatel-libs

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Driver and interface for GPS Novatel

GNU_CONFIGURE=		yes

include ../../middleware/pocolibs/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../devel/mkdep/depend.mk
include ../../mk/robotpkg.mk
