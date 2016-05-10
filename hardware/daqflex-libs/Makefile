# robotpkg Makefile for:	hardware/daqflex-libs
# Created:			Matthieu Herrb on Thu, 16 May 2013
#

PKGREVISION=		1
CATEGORIES=		hardware
DISTNAME=		daqflex-libs-0.1
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=daqflex/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/daqflex-libs

COMMENT=		Interface library for MCC DAQFlex USB-201 ADC
MAINTAINER=		openrobots@laas.fr
LICENSE=		isc

GNU_CONFIGURE=		yes

pre-configure: autoreconf

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/autoconf.mk
include ../../mk/sysdep/automake.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/sysdep/libusb1.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
