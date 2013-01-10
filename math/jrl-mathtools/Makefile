# robotpkg Makefile for:	math/jrl-mathtools
# Created:			Anthony Mallet on Wed, 17 Sep 2008
#

DISTNAME=		jrl-mathtools-1.5.1
CATEGORIES=		math
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=jrl-mathtools/}
MASTER_REPOSITORY=	git http://github.com/jrl-umi3218/jrl-mathtools.git

MAINTAINER=	hpp@laas.fr
HOMEPAGE=	https://github.com/jrl-umi3218/jrl-mathtools
COMMENT=	Basic mathematical tools used in the JRL software
LICENSE=	gnu-lgpl-v3

DOXYGEN_PLIST_DIR+=	share/doc/jrl-mathtools

CMAKE_ARGS+=	-DBOOST_INCLUDEDIR=${PREFIX.boost-headers}/include
CMAKE_ARGS+=	-DBOOST_LIBRARYDIR=${PREFIX.boost-libs}/lib

# See pre-configure below for an explanation
CMAKE_ARGS+=	-DCMAKE_MODULE_PATH=${WRKSRC}/cmake

DEPEND_ABI.boost-headers=	boost-headers>=1.40
DEPEND_ABI.boost-libs=		boost-libs>=1.40

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../math/lapack/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/language/fortran.mk
include ../../mk/robotpkg.mk

# cmake-2.8.6 has a buggy FindLAPACK: typo in CMAKE_FIND_LIBRARY_SUFFIXES
# spelling (#12624)
pre-configure:
	${RUN}if ${TEST} "${PKGVERSION.cmake}" = "cmake-2.8.6"; then	\
	  ${CP} ${FILESDIR}/FindLAPACK.cmake ${WRKSRC}/cmake/.;		\
	fi
