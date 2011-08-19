# robotpkg Makefile for:	devel/boost-log
# Created:			Jan Paulus on Mon, 27 Sep 2010
#

PKGVERSION=		1.0
DISTNAME=	        boost-log-${PKGVERSION_NOREV}
EXTRACT_SUFX?=		.zip
MASTER_SITES=		http://downloads.sourceforge.net/project/boost-log/

CATEGORIES=		devel
MAINTAINER=		jan.paulus@h-brs.de
HOMEPAGE=		http://sourceforge.net/projects/boost-log
COMMENT=		C++ logging library
LICENSE=		bsl

CONFIGURE_ARGS+=	BOOST_LIBS=${PREFIX.boost-libs}
CONFIGURE_ARGS+=	BOOST_HEADERS=${PREFIX.boost-headers}
USE_LANGUAGES=		c c++
INSTALLATION_DIRS+=	include/boost

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../mk/sysdep/autoconf.mk
include ../../mk/sysdep/automake.mk
include ../../mk/robotpkg.mk

post-extract:
	${RUN}cd ${WRKSRC} &&					\
	${SED} <${FILESDIR}/configure.ac >configure.ac		\
		-e 's/@PKGVERSION@/${PKGVERSION}/g'		\
		-e 's/@PKGNAME_NOREV@/${PKGNAME_NOREV}/g' &&	\
	cp ${FILESDIR}/Makefile.am Makefile.am

pre-configure: autoreconf

post-install:
	${RUN}cd ${WRKSRC} && cd boost &&			\
	${PAX} -rw -pm . ${PREFIX}/include/boost
