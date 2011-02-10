# robotpkg Makefile for:	modeling/vcglib
# Created:			nksallem on Wed, 25 Aug 2010
#

PKGVERSION=		20100824
PKGNAME=		vcglib-${PKGVERSION}
DISTNAME=		vcglib-${PKGVERSION_NOREV}

CATEGORIES=		graphics
FETCH_METHOD=		svn
MASTER_SITES=\
	https://vcg.svn.sourceforge.net/svnroot/vcg/trunk/vcglib@3811
MASTER_REPOSITORY=\
	svn https://vcg.svn.sourceforge.net/svnroot/vcg/trunk/vcglib
FETCH_BEFORE_ARGS=	--ignore-externals # ignore unversionned eigen external

MAINTAINER=		mallet@laas.fr
HOMEPAGE=		http://vcg.sourceforge.net/index.php/VCGLib
COMMENT=		C++ templated library for mesh manipulation
LICENSE=		gnu-gpl-v2

INSTALL_TARGET=		install

USE_LANGUAGES=		c++

# fix path to eigen
SUBST_CLASSES+=		eigen
SUBST_MESSAGE.eigen=	Fixing Eigen path in headers.
SUBST_STAGE.eigen=	post-extract
SUBST_SED.eigen=	-e 's,\(..\|vcg\)/Eigen,Eigen,g'
SUBST_FILES.eigen=\
	vcg/math/eigen.h				\
	vcg/complex/trimesh/update/curvature_fitting.h	\
	vcg/complex/trimesh/update/fitmaps.h


# doc option ---------------------------------------------------------------
PKG_SUPPORTED_OPTIONS+= doc
PKG_SUGGESTED_OPTIONS+= doc
PKG_OPTION_DESCR.doc?=  Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  INSTALL_TARGET+=	install-doc
  DOXYGEN_PLIST_DIR+=	share/doc/vcglib/html
  CMAKE_ARGS+=		-DDOXYGEN_EXECUTABLE=${DOXYGEN}

  include ../../mk/sysdep/doxygen.mk
endef # doc ----------------------------------------------------------------

include ../../math/eigen2/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk

post-extract:
	${CP} ${FILESDIR}/CMakeLists.txt ${WRKSRC}
	${RM} -rf ${WRKSRC}/vcg/Eigen
