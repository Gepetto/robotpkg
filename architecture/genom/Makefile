# robotpkg Makefile for:	architecture/genom
# Created:			Anthony Mallet on Sun, 28 Jan 2007
#

DISTNAME=	genom-2.6
CATEGORIES=	architecture
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=genom/}
MASTER_REPOSITORY= git ssh://trac.laas.fr/git/robots/genom

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	https://softs.laas.fr/openrobots/wiki/genom
COMMENT=	Software components generator for robotics architecture.

LICENSE=	2-clause-bsd

GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	PERL=${PREFIX.perl}/bin/perl

# genom must be able to compile c++ modules, and it checks for a c++
# compiler
USE_LANGUAGES+=	c c++

# Problem with quoting ccache in mkdep invocation
USE_CCACHE=	no

# --- "tcl" option ---------------------------------------------------

PKG_SUPPORTED_OPTIONS+=	tcl
PKG_SUGGESTED_OPTIONS+=	tcl

PKG_OPTION_DESCR.tcl=	Enable support for TCL clients
define PKG_OPTION_SET.tcl
  CONFIGURE_ARGS+=	--with-tcl=$(dir ${TCL_CONFIG_SH})
  include ../../mk/sysdep/tcl.mk
endef
define PKG_OPTION_UNSET.tcl
  CONFIGURE_ARGS+=	--without-tcl
endef

# --- "doc" option ---------------------------------------------------

PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc

PKG_OPTION_DESCR.doc=	Compile documentation material
define PKG_OPTION_SET.doc
  CONFIGURE_ENV+=	LATEX=${PDFLATEX}
  include ../../mk/sysdep/pdflatex.mk
endef
define PKG_OPTION_UNSET.doc
  CONFIGURE_ENV+=	LATEX=:
endef

include ../../devel/pocolibs/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/sysdep/perl.mk
include ../../mk/sysdep/flex.mk
include ../../mk/sysdep/bison.mk
include ../../mk/robotpkg.mk
