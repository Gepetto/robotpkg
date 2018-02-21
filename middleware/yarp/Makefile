# robotpkg Makefile for:	middleware/yarp
# Created:			Anthony Mallet on Thu, 22 Jan 2009
#

VERSION= 	2.3.64
PKGNAME=   yarp-${VERSION}
DISTNAME=		v${VERSION}
CATEGORIES=		middleware
MASTER_SITES=		https://github.com/robotology/yarp/archive/
MASTER_REPOSITORY=	git git://github.com/robotology/yarp.git
PKGREVISION=		3

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://eris.liralab.it/yarpdoc/index.html
COMMENT=		Yet Another Robot Platform
LICENSE=		gnu-lgpl-v2

CONFIGURE_ENV+=		ACE_ROOT=${PREFIX.ace}
CMAKE_ARGS+=		-DCREATE_SHARED_LIBRARY=TRUE
CMAKE_ARGS+=		-DEXPERIMENTAL_ACEFIND=TRUE

CMAKE_ARGS+=		-DCMAKE_INSTALL_LIBDIR=lib

CMAKE_ARGS+=		-DCREATE_OPTIONAL_CARRIERS=TRUE
CMAKE_ARGS+=		-DENABLE_yarpcar_bayer_carrier=TRUE
CMAKE_ARGS+=		-DENABLE_yarpcar_human_carrier=TRUE
CMAKE_ARGS+=		-DENABLE_yarpcar_mjpeg_carrier=TRUE
CMAKE_ARGS+=		-DENABLE_yarpcar_portmonitor_carrier=TRUE
CMAKE_ARGS+=		-DENABLE_yarpcar_priority_carrier=TRUE
CMAKE_ARGS+=		-DENABLE_yarpcar_rossrv_carrier=TRUE
CMAKE_ARGS+=		-DENABLE_yarpcar_tcpros_carrier=TRUE
CMAKE_ARGS+=		-DENABLE_yarpcar_xmlrpc_carrier=TRUE

CMAKE_ARGS+=	-DTinyXML_INCLUDE_DIRS=${PREFIX.tinyxml}/include
CMAKE_ARGS+=	-DTinyXML_LIBRARIES=$(filter %.so,${SYSTEM_FILES.tinyxml})

# XXX needs something more generic
CXXFLAGS+=		-pthread

WRKSRC= ${WRKDIR}/yarp-${VERSION}

# PLIST depends on cmake version
PLIST_VARS+=  cmake31
PLIST.cmake31=$(if $(filter yes,\
  $(call pmatch,cmake>=3.1,${PKGVERSION.cmake})),@comment)

# gui option
PKG_SUPPORTED_OPTIONS+=	gui
PKG_SUGGESTED_OPTIONS+=	gui
PKG_OPTION_DESCR.doc?=	Install GUI utilities


define PKG_OPTION_SET.gui
  CXXFLAGS+=		-std=c++11
  CMAKE_ARGS+=		-DCREATE_GUIS=TRUE

  include ../../mk/sysdep/gtk.mk
  include ../../mk/sysdep/gtkmm.mk
  include ../../mk/sysdep/libglademm.mk
  include ../../mk/sysdep/glib2.mk
  include ../../mk/sysdep/qt5-base.mk
  include ../../mk/sysdep/qt5-multimedia.mk
  include ../../mk/sysdep/qt5-declarative.mk
endef

DEPEND_ABI.cmake=	cmake>=2.8.9

include ../../devel/tinyxml/depend.mk
include ../../image/opencv/depend.mk
include ../../middleware/ace/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/libjpeg.mk
include ../../mk/sysdep/lua.mk
include ../../mk/sysdep/readline.mk
include ../../mk/sysdep/sqlite3.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
