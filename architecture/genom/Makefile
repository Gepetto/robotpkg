# robotpkg Makefile for:	architecture/genom
# Created:			Anthony Mallet on Sun, 28 Jan 2007
#

DISTNAME=	genom-2.8.1
CATEGORIES=	architecture
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=genom/}
MASTER_REPOSITORY= git ssh://trac.laas.fr/git/robots/genom

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	https://softs.laas.fr/openrobots/wiki/genom
COMMENT=	Software components generator for robotics architecture.

LICENSE=	2-clause-bsd

MAKE_JOBS_SAFE=	no
GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	PERL=${PREFIX.perl}/bin/perl

NOT_FOR_PLATFORM=	# empty

# genom must be able to compile c++ modules, and it checks for a c++
# compiler
USE_LANGUAGES+=	c c++

# Problem with quoting ccache in mkdep invocation
USE_CCACHE=	no

# --- "xenomai' option -----------------------------------------------

PKG_SUPPORTED_OPTIONS+=	xenomai
PKG_OPTION_DESCR.xenomai:=	Enable Xenomai support

define PKG_OPTION_SET.xenomai
  CONFIGURE_ARGS+=	--with-xenomai
  DEPEND_ABI.pocolibs+=	pocolibs>~xenomai
  include ../../mk/sysdep/xenomai.mk
endef

# --- "doc" option ---------------------------------------------------

PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc

PKG_OPTION_DESCR.doc=	Compile documentation material
define PKG_OPTION_SET.doc
  CONFIGURE_ENV+=	LATEX=${PDFLATEX}
  include ../../mk/sysdep/pdflatex.mk

  USE_TEX_PKGS+=	lmodern.sty multirow.sty a4wide.sty varioref.sty
  include ../../mk/sysdep/tex-pkg.mk
endef
define PKG_OPTION_UNSET.doc
  CONFIGURE_ENV+=	LATEX=:
endef

# configure script is missing in distfile
include ../../mk/sysdep/autoconf.mk
include ../../mk/sysdep/automake.mk

pre-configure:
	${RUN}cd ${WRKSRC} &&						\
	${LIBTOOL}ize -c &&						\
	${PREFIX.automake}/bin/aclocal -I m4				\
	  $(addprefix -I,$(addsuffix /share/aclocal,			\
	    $(filter-out ${PREFIX.autoconf},${PREFIX.pkg-config}))) &&	\
	${AUTOCONF} -f

include ../../devel/mkdep/depend.mk
include ../../middleware/pocolibs/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/sysdep/perl.mk
include ../../mk/sysdep/flex.mk
include ../../mk/sysdep/bison.mk
include ../../mk/robotpkg.mk
