# robotpkg Makefile for:	hardware/daqflex-libs
# Created:			Matthieu Herrb on Thu, 16 May 2013
#

CATEGORIES=		hardware
DISTNAME=		daqflex-libs-1.0
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=daqflex/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}/daqflex-libs

COMMENT=		Interface library for MCC DAQFlex USB-201 ADC
HOMEPAGE=		https://git.openrobots.org/projects/daqflex-libs
MAINTAINER=		openrobots@laas.fr
LICENSE=		isc

GNU_CONFIGURE=		yes

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/libusb1.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
