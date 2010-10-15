# robotpkg Makefile for:	devel/pocolibs
# Created:			Anthony Mallet on Sun, 28 Jan 2007
#

DISTNAME=		pocolibs-2.8
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=pocolibs/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/pocolibs

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		https://softs.laas.fr/openrobots/wiki/pocolibs
COMMENT=		Real-time communication library used by GenoM modules.

LICENSE=		isc

NOT_FOR_PLATFORM=	%-x86_64
GNU_CONFIGURE=		yes

# Enable valgrind support
PKG_SUPPORTED_OPTIONS+=	valgrind
PKG_OPTION_DESCR.valgrind:=	Enable valgrind support

define PKG_OPTION_SET.valgrind
  CONFIGURE_ARGS+=	--enable-valgrind
  include ../../mk/sysdep/valgrind.mk
endef

# Xenomai option
PKG_SUPPORTED_OPTIONS+=	xenomai
PKG_OPTION_DESCR.xenomai:=	Enable Xenomai support

define PKG_OPTION_SET.xenomai
  CONFIGURE_ARGS+=	--with-xenomai
  include ../../mk/sysdep/xenomai.mk
endef

include ../../devel/mkdep/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
