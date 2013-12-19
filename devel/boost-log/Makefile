# robotpkg Makefile for:	devel/boost-log
# Created:			Jan Paulus on Mon, 27 Sep 2010
#

PKGVERSION=		1.1
DISTNAME=	        boost-log-${PKGVERSION_NOREV}
EXTRACT_SUFX?=		.zip
MASTER_SITES=		http://downloads.sourceforge.net/project/boost-log/

CATEGORIES=		devel
MAINTAINER=		jan.paulus@h-brs.de
HOMEPAGE=		http://sourceforge.net/projects/boost-log
COMMENT=		C++ logging library
LICENSE=		bsl

INSTALLATION_DIRS+=	include/boost

USE_BOOST_LIBS= date_time filesystem system thread

INCLUDE_DIRS.boost-headers=${PREFIX.boost-headers}/include

LIBRARY_DIRS.boost-lib-date_time=$(dir ${SYSTEM_FILES.boost-lib-date_time})
RPATH_DIRS.boost-lib-date_time=$(dir ${SYSTEM_FILES.boost-lib-date_time})
LDFLAGS+=	-lboost_date_time${BOOST_LIB_SUFFIX}

LIBRARY_DIRS.boost-lib-filesystem=$(dir ${SYSTEM_FILES.boost-lib-filesystem})
RPATH_DIRS.boost-lib-filesystem=$(dir ${SYSTEM_FILES.boost-lib-filesystem})
LDFLAGS+=	-lboost_filesystem${BOOST_LIB_SUFFIX}

LIBRARY_DIRS.boost-lib-system=$(dir ${SYSTEM_FILES.boost-lib-system})
RPATH_DIRS.boost-lib-system=$(dir ${SYSTEM_FILES.boost-lib-system})
LDFLAGS+=	-lboost_system${BOOST_LIB_SUFFIX}

LIBRARY_DIRS.boost-lib-thread=$(dir ${SYSTEM_FILES.boost-lib-thread})
RPATH_DIRS.boost-lib-thread=$(dir ${SYSTEM_FILES.boost-lib-thread})
LDFLAGS+=	-lboost_thread${BOOST_LIB_SUFFIX}

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../archivers/pax/depend.mk
include ../../mk/sysdep/autoconf.mk
include ../../mk/sysdep/automake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
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
