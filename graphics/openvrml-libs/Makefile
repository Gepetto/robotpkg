# robotpkg Makefile for:	devel/openvrml-libs
# Created:			Thomas Moulard on Wed, 8 Sep 2010
#

PKGVERSION=		0.18.9
DISTNAME=		openvrml-${PKGVERSION_NOREV}
PKGNAME=		openvrml-libs-${PKGVERSION}
CATEGORIES=		graphics
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=openvrml/}

MAINTAINER=		tmoulard@laas.fr
HOMEPAGE=		http://www.openvrml.org
COMMENT=		A free VRML/X3D runtime
LICENSE=		gnu-lgpl-v3

# Triggers a g++-4.1.2 internal error
NOT_FOR_PLATFORM+=	NetBSD-5.1-%

GNU_CONFIGURE=		yes
DYNAMIC_PLIST_DIRS=	share/doc/${DISTNAME}

# build libraries only.
CONFIGURE_ARGS+=--disable-gecko-rpath
CONFIGURE_ARGS+=--disable-script-node-javascript
CONFIGURE_ARGS+=--disable-script-node-java
CONFIGURE_ARGS+=--disable-xembed
CONFIGURE_ARGS+=--disable-player
CONFIGURE_ARGS+=--disable-mozilla-plugin
CONFIGURE_ARGS+=--disable-examples

CONFIGURE_ARGS+=--enable-gl-renderer

# get the right boost libraries
USE_BOOST_LIBS+=thread filesystem system
CONFIGURE_ARGS+=BOOST_LIB_SUFFIX=${BOOST_LIB_SUFFIX}
CONFIGURE_ARGS+=ov_cv_boost_thread=$(lastword ${SYSTEM_FILES.boost-lib-thread})

# fix detection of ltdl and boost. configure script searches in /usr only.
INCLUDE_DIRS.boost-headers+=	include
INCLUDE_DIRS.libtool-ltdl+=	include

LIBRARY_DIRS.boost-libs+=	lib
LIBRARY_DIRS.libtool-ltdl+=	lib

# uses boost filesystem v3, not compatible with boost>=1.60
DEPEND_ABI.boost-headers=	boost-headers>=1.44<1.60
DEPEND_ABI.boost-libs=		boost-libs>=1.44<1.60

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/glu.mk
include ../../mk/sysdep/libjpeg.mk
include ../../mk/sysdep/libpng.mk
include ../../mk/sysdep/libtool-ltdl.mk
include ../../mk/sysdep/libxml2.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
