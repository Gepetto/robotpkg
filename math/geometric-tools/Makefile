# robotpkg Makefile for:	math/geometric-tools
# Created:			Antonio El Khoury on Tue, 7 Feb 2012
#

PKGREVISION=	1
PKGNAME=	geometric-tools-${WM5_VERSION_MAJOR}p${WM5_VERSION_MINOR}
DISTNAME=	${WM5_NAME}${WM5_VERSION_MAJOR}p${WM5_VERSION_MINOR}
MASTER_SITES=	${HOMEPAGE}/Downloads/
EXTRACT_SUFX=	.zip

CATEGORIES=	math
MAINTAINER=	hpp@laas.fr
HOMEPAGE=	http://www.geometrictools.com
COMMENT=	Geometric tools for mathematics, physics, graphics, imagics
LICENSE=	bsl

NOT_FOR_PLATFORM+=	Darwin-%

WM5_NAME=		WildMagic
WM5_VERSION_MAJOR=	5
WM5_VERSION_MINOR=	7

WRKSRC=		${WRKDIR}/GeometricTools/${WM5_NAME}${WM5_VERSION_MAJOR}
NO_CONFIGURE=	yes

INSTALLATION_DIRS+=\
		include/geometric-tools	\
		lib

CFLAGS+=	-DWM5_USE_OPENGL
CFLAGS+=	-D__LINUX__ # not true, but means 'unix'

# Compile flags for dependencies
INCLUDE_DIRS.glu+=	include
INCLUDE_DIRS.libX11+=	include
INCLUDE_DIRS.mesa+=	include

LIBRARY_DIRS.glu+=	lib
LIBRARY_DIRS.libX11+=	lib
LIBRARY_DIRS.mesa+=	lib

RPATH_DIRS.glu+=	lib
RPATH_DIRS.libX11+=	lib
RPATH_DIRS.mesa+=	lib


# Fix horrid Makefile...
CFG=			ReleaseDynamic
LIBPATH=		-L../../SDK/Library/$(CFG) ${LDFLAGS}
MAKE_FLAGS+=		CFG=${CFG}
MAKE_FLAGS+=		GRF=Glx
MAKE_FLAGS+=		CC=$(call quote,${ROBOTPKG_CXX})
MAKE_FLAGS+=		CFLAGS=$(call quote,${CFLAGS} -fPIC -c)
MAKE_FLAGS+=		ARFLAGS=$(call quote,${LDFLAGS} -shared -fPIC -o)
MAKE_FLAGS+=		LIBPATH=$(call quote,${LIBPATH})
MAKE_FILE+=		${WRKSRC}/makefile.wm5
BUILD_TARGET=		build

SUBST_CLASSES+=		make
SUBST_STAGE.make=	post-extract
SUBST_MESSAGE.make=	Fixing hardcoded make program.
SUBST_FILES.make=	makefile.wm5 */makefile.wm5
SUBST_SED.make=		-e 's/ make / $${MAKE} /g'

include ../../pkgtools/pax/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/glu.mk
include ../../mk/sysdep/libX11.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

do-install:
	${RUN} \
	${CP} ${WRKSRC}/SDK/Include/*.h ${WRKSRC}/SDK/Include/*.inl	\
		${DESTDIR}${PREFIX}/include/geometric-tools/;		\
	${CP} ${WRKSRC}/SDK/Library/${CFG}/*.so ${DESTDIR}${PREFIX}/lib/
