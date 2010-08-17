# robotpkg Makefile for:	hardware/cwiid
# Created:			Matthieu Herrb on Mon, 22 Dec 2008
#

DISTNAME=	cwiid-${VERSION}
VERSION=	0.6.00
EXTRACT_SUFX=	.tgz
CATEGORIES=	hardware
MASTER_SITES=	http://abstrakraft.org/cwiid/downloads/

HOMEPAGE=	http://abstrakraft.org/cwiid/
MAINTAINER=	openrobots@laas.fr
COMMENT=	Tools for interfacing to the Nintendo Wiimote
LICENSE=	gnu-gpl-v2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-ldconfig


include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
