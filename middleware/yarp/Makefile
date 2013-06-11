# robotpkg Makefile for:	middleware/yarp
# Created:			Anthony Mallet on Thu, 22 Jan 2009
#

PKGREVISION=		1
DISTNAME=		yarp-2.3.20.1
CATEGORIES=		middleware
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=yarp0/}
MASTER_REPOSITORY=	git git://github.com/robotology/yarp.git

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://eris.liralab.it/yarpdoc/index.html
COMMENT=		Yet Another Robot Platform
LICENSE=		gnu-lgpl-v2

CONFIGURE_ENV+=		ACE_ROOT=${PREFIX.ace}
CMAKE_ARGS+=		-DCREATE_SHARED_LIBRARY=TRUE
CMAKE_ARGS+=		-DEXPERIMENTAL_ACEFIND=TRUE

# XXX needs something more generic
CXXFLAGS+=		-pthread

# gui option
PKG_SUPPORTED_OPTIONS+=	gui
PKG_SUGGESTED_OPTIONS+=	gui
PKG_OPTION_DESCR.doc?=	Install GUI utilities


define PKG_OPTION_SET.gui
  CMAKE_ARGS+=		-DCREATE_GUIS=TRUE

  include ../../mk/sysdep/gtk.mk
  include ../../mk/sysdep/gtkmm.mk
  include ../../mk/sysdep/libglademm.mk
  include ../../mk/sysdep/glib2.mk
endef

include ../../middleware/ace/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/sqlite3.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
