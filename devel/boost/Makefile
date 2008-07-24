# $NetBSD: Makefile.common,v 1.9 2006/11/10 17:41:13 tv Exp $
#

BOOST_VERSION=		1.33.1
PKGREVISION=		1
PKGNAME=		boost-${BOOST_VERSION}
DISTNAME=		boost_$(subst .,_,${BOOST_VERSION})
CATEGORIES=		devel

MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=boost/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.boost.org/
COMMENT=		Free, peer-reviewed portable C++ source libraries.

include ../../mk/robotpkg.prefs.mk

ifeq (${OPSYS},"Darwin")
BOOST_TOOLSET=          darwin
else
 ifneq (,$(filter gcc,${PKGSRC_COMPILER}))
BOOST_TOOLSET=          gcc
 else
PKG_FAIL_REASON+=       "Unknown compiler ${PKGSRC_COMPILER} for Boost."
 endif
endif

BJAM=                   ${WRKSRC}/tools/build/jam_src/bin.*/bjam
BJAM_ARGS+=             --builddir=${WRKSRC}/build
BJAM_ARGS+=             --layout=system
BJAM_ARGS+=             --prefix=${PREFIX}
BJAM_ARGS+=             -sBUILD=$(call quote,${BJAM_BUILD})
BJAM_ARGS+=             -sTOOLS=${BOOST_TOOLSET}

# force bzip2 location
BJAM_ARGS+=             -sBZIP2_INCLUDE=${PREFIX}/include
BJAM_ARGS+=             -sBZIP2_LIBPATH=${PREFIX}/lib

BJAM_ARGS+=		--without-python
BJAM_ARGS+=		--without-serialization # Requires wide I/O

ifeq (${OPSYS},"Darwin")
BJAM_ARGS+=             -sTARGET_LIBDIR=${PREFIX}/lib
endif
BJAM_BUILD+=            <linkflags>${COMPILER_RPATH_FLAG}${PREFIX}/lib
BJAM_BUILD+=            <threading>multi
BJAM_BUILD+=            release
BJAM_CMD=               ${SETENV} ${MAKE_ENV} ${BJAM} ${BJAM_ARGS}

include ../../archivers/bzip2/depend.mk
include ../../mk/robotpkg.mk

# Generate a new user.hpp and compile bjam
do-configure:
	${_PKG_SILENT}${_PKG_DEBUG}cd ${WRKSRC}/libs/config && \
	    ${SETENV} ${CONFIGURE_ENV} ${SH} ./configure
	${_PKG_SILENT}${_PKG_DEBUG}${CP} -f \
		${WRKSRC}/libs/config/user.hpp ${WRKSRC}/boost/config/user.hpp

do-build:
	${_PKG_SILENT}${_PKG_DEBUG}cd ${WRKSRC}/tools/build/jam_src && \
		${SETENV} ${MAKE_ENV} ${SH} ./build.sh ${BOOST_TOOLSET}
	${_PKG_SILENT}${_PKG_DEBUG}cd ${WRKSRC} && ${BJAM_CMD} stage

do-install:
	${_PKG_SILENT}${_PKG_DEBUG}cd ${WRKSRC} && ${BJAM_CMD} install

# We can't do this at post-extract because the extract cookie will get a
# future timestamp than the sources.  If this happens, print-PLIST does
# not work.
pre-configure:
	@cd ${WRKSRC} && ${FIND} . -type f -print | ${XARGS} ${TOUCH}

#boost-install-libs:
#	cd ${WRKSRC}/stage/lib && ${PAX} -rwpe libboost* ${PREFIX}/lib
