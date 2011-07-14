# robotpkg Makefile for:	middleware/libpyyarp
# Created:			Severin Lemaignan on Fri, 12 Jun 2009
#

PKGVERSION=		2.3.1
PKGREVISION=		1
DISTNAME=		yarp-${PKGVERSION_NOREV}
PKGNAME=		libpyyarp-${PKGVERSION}
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=yarp0/}

CATEGORIES=		middleware
MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://eris.liralab.it/yarpdoc/index.html
COMMENT=		Python bindings for YARP
LICENSE=		gnu-lgpl-v2

USE_LANGUAGES+=		c c++ python

CMAKE_ARGS+=		-DCREATE_PYTHON=TRUE
CMAKE_ARGS+=		-DPYTHON_EXECUTABLE=${PYTHON}
CMAKE_ARGS+=		-DPYTHON_INCLUDE_PATH=${PYTHON_INCLUDE}
CMAKE_ARGS+=		-DPYTHON_LIBRARY=${PYTHON_LIB}
CMAKE_ARGS+=		-DCMAKE_BUILD_WITH_INSTALL_RPATH=TRUE

CMAKE_ARGS+=		-DCREATE_SHARED_LIBRARY=TRUE
CMAKE_ARGS+=		-DACE_INCLUDE_DIR=${PREFIX.ace}/include
CMAKE_ARGS+=		-DACE_LIBRARY=${PREFIX.ace}/lib/libACE.so

CONFIGURE_DIRS=		${WRKSRC} ${WRKSRC}/example/swig
BUILD_DIRS=		${WRKSRC}/example/swig
INSTALLATION_DIRS=	${PYTHON_SITELIB}

include ../../devel/swig/depend.mk
include ../../middleware/yarp/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk

post-configure:
	${RUN}for f in dev sig OS init; do				\
	  ${CONFIGURE_LOGFILTER}					\
	    ${LN} -sf ${PREFIX.yarp}/lib/libYARP_$${f}.so ${WRKSRC}/lib;\
	done

do-install:
	${RUN}${INSTALL_DATA} ${WRKSRC}/example/swig/*.py		\
		${PREFIX}/${PYTHON_SITELIB}
	${RUN}${INSTALL_LIB} ${WRKSRC}/example/swig/_yarp.so		\
		${PREFIX}/${PYTHON_SITELIB}
