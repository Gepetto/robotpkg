# robotpkg Makefile for:	hardware/libmesasr-1.0.14
# Created:			Matthieu Herrb on Fri, 27 Aug 2010
#

PKGNAME=	libmesasr-$(subst -,.,${VERSION})
DISTNAME=	libmesasr-dev-${VERSION}.i386
VERSION=	1.0.14-653
CATEGORIES=	hardware
MASTER_SITES=	http://www.mesa-imaging.ch/customer/driver/

HOMEPAGE=	http://www.mesa-imaging.ch/
COMMENT=	API for the MESA Imaging Swiss Ranger Time of flight camera

LICENSE=	mesa-imaging-license
NO_PUBLIC_SRC=	This package may not be redistributed
NO_PUBLIC_BIN=	This package may not be redistributed

EXTRACT_SUFX=	.deb

WRKSRC=		${WRKDIR}

ONLY_FOR_PLATFORM=	Linux-%-i386

NO_BUILD=	Yes

include ../../pkgtools/install-sh/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../mk/robotpkg.mk

.PHONY: do-install

do-install:
	${INSTALL_LIB} ${WRKSRC}/usr/lib/libmesasr.so.1.0.14 ${PREFIX}/lib
	cd ${PREFIX}/lib && rm -f libmesasr.so && \
	 ln -s libmesasr.so.1.0.14 libmesasr.so
	${INSTALL_DATA} -c ${WRKSRC}/usr/include/definesSR.h ${PREFIX}/include
	${INSTALL_DATA} -c ${WRKSRC}/usr/include/libMesaSR.h ${PREFIX}/include
	cd ${WRKSRC}/usr/share && ${PAX} -rwp ma . ${PREFIX}/share/
