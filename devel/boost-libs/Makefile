# robotpkg Makefile for:	devel/boost-libs
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

# Borrowed from NetBSD pkgsrc,
# $NetBSD: Makefile,v 1.11 2008/05/09 12:50:31 drochner Exp $

BOOST_PACKAGE=		libs
BOOST_COMMENT=		(binary libraries)

PREFER.boost?=		robotpkg
include ../../devel/boost/Makefile.common

BJAM_ARGS+=		--without-python
INSTALLATION_DIRS=	lib

include ../../devel/boost-jam/depend.mk
include ../../archivers/bzip2/depend.mk
include ../../archivers/zlib/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../mk/robotpkg.mk

do-configure:
	${RUN}exec >${WRKSRC}/tools/build/v2/site-config.jam;	\
	${ECHO} 'using ${BOOST_TOOLSET} : : ${CXX} ;'

do-build: bjam-build
	@${TRUE}

do-install:
	${RUN}cd ${WRKSRC}/stage/lib && ${INSTALL_LOGFILTER}	\
	  ${PAX} -rw -p mp libboost* ${PREFIX}/lib
