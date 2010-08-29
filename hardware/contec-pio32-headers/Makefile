# robotpkg Makefile for:	hardware/contec-pio32-headers
# Created:			Matthieu Herrb on Tue, 6 Jan 2009
#

V=		1.0
DISTNAME=	contec-pio32-kmod-$V
PKGNAME=	contec-pio32-headers-$V
CATEGORIES=	hardware
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=linux/}

MAINTAINER=	openrobots@laas.fr
COMMENT=	header files for Contec PIO32 kernel interface
LICENSE=	isc

NO_CONFIGURE=	yes
NO_BUILD=	yes

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/include
	${INSTALL_DATA} ${WRKSRC}/contec_dio.h ${PREFIX}/include

include ../../pkgtools/install-sh/depend.mk
include ../../mk/robotpkg.mk
