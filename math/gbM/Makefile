# robotpkg Makefile for:	math/gbM
# Created:			Xavier Broquere on Tue, 10 Mar 2009
#

PKGREVISION=	1
DISTNAME=	gbM-0.9
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=gbM/}
MASTER_REPOSITORY= git ssh://git.openrobots.org/git/robots/gbM

MAINTAINER=	daniel.sidobre@laas.fr
COMMENT=	Geometry for 6R arms
LICENSE=	isc

NOT_FOR_PLATFORM=	# empty

# options
PKG_SUPPORTED_OPTIONS+=	tcl
PKG_SUGGESTED_OPTIONS+=	tcl
PKG_OPTION_DESCR.tcl=	Enable installation of TCL bindings

define PKG_OPTION_SET.tcl
  CONFIGURE_ARGS+=--with-tcl=$(dir ${TCL_CONFIG_SH})
  CONFIGURE_ARGS+=--with-tk=$(dir ${TK_CONFIG_SH})
  CONFIGURE_ARGS+=SWIG=$(call quote,${SWIG})
  CONFIGURE_ARGS+=--enable-gbtcl

  include ../../mk/sysdep/tcl.mk
  include ../../mk/sysdep/tk.mk
  include ../../devel/swig/depend.mk
endef
define PKG_OPTION_UNSET.tcl
  CONFIGURE_ARGS+=--disable-gbtcl
endef

pre-configure: autoreconf

include ../../devel/mkdep/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/sysdep/autoconf.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
