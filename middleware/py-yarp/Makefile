# robotpkg Makefile for:	middleware/py-yarp
# Created:			Severin Lemaignan on Fri, 12 Jun 2009
#

VERSION=		2.3.22
DISTNAME=		yarp-${VERSION}
PKGNAME=		${PKGTAG.python-}yarp-${VERSION}
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=yarp0/}
PKGREVISION= 	1

CATEGORIES=		middleware
MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://eris.liralab.it/yarpdoc/index.html
COMMENT=		Python bindings for YARP
LICENSE=		gnu-lgpl-v2

CONFLICTS+=		libpyyarp-[0-9]*
CONFLICTS+=		${PKGTAG.python-}libpyyarp-[0-9]*

PKG_OPTIONS_SUFFIX=	py-yarp

CMAKE_ARGS+=		-DCREATE_PYTHON=TRUE
CMAKE_ARGS+= 		-DCOMPILE_INPLACE=TRUE
CMAKE_ARGS+=		-DPYTHON_EXECUTABLE=${PYTHON}
CMAKE_ARGS+=		-DPYTHON_INCLUDE_PATH=${PYTHON_INCLUDE}
CMAKE_ARGS+=		-DPYTHON_LIBRARY=${PYTHON_LIB}
CMAKE_ARGS+=		-DCMAKE_BUILD_WITH_INSTALL_RPATH=TRUE

CMAKE_ARGS+=		-DCREATE_SHARED_LIBRARY=TRUE
CMAKE_ARGS+=		-DACE_INCLUDE_DIR=${PREFIX.ace}/include
CMAKE_ARGS+=		-DACE_LIBRARY=${PREFIX.ace}/lib/libACE.so

SWIG_DIR= 			${WRKSRC}/bindings
CONFIGURE_DIRS=		${WRKSRC} ${SWIG_DIR}
BUILD_DIRS=			${SWIG_DIR}
INSTALLATION_DIRS=	${PYTHON_SITELIB}

DEPEND_ABI.cmake= 	cmake>=2.8.7
DEPEND_ABI.yarp=	yarp>=${VERSION}<2.3.60

include ../../devel/swig/depend.mk
include ../../middleware/yarp/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

post-configure:
	${RUN}for f in dev sig OS init; do				\
	  ${LN} -sf ${PREFIX.yarp}/lib/libYARP_$${f}.so ${WRKSRC}/lib;	\
	done

do-install:
	${RUN}cd ${SWIG_DIR} &&				\
	  for f in yarp.py example.py example_img.py; do		\
	    ${INSTALL_DATA} $$f ${PREFIX}/${PYTHON_SITELIB};		\
	  done;								\
	  ${INSTALL_LIB} _yarp.so ${PREFIX}/${PYTHON_SITELIB}

post-install:
	${RUN} ${PYTHON} -c 'import py_compile;				\
	  py_compile.compile("${PREFIX}/${PYTHON_SITELIB}/yarp.py");	\
	  py_compile.compile("${PREFIX}/${PYTHON_SITELIB}/example.py");	\
	  py_compile.compile("${PREFIX}/${PYTHON_SITELIB}/example_img.py");\
	'
	${RUN} ${PYTHON} -O -c 'import py_compile;			\
	  py_compile.compile("${PREFIX}/${PYTHON_SITELIB}/yarp.py");	\
	  py_compile.compile("${PREFIX}/${PYTHON_SITELIB}/example.py");	\
	  py_compile.compile("${PREFIX}/${PYTHON_SITELIB}/example_img.py");\
	'
