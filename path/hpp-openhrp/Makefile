# robotpkg Makefile for:	path/hpp-openhrp
# Created:			Anthony Mallet on Mon, 27 Aug 2007
#

DISTNAME=	hppOpenHRP-${VERSION}
PKGNAME=	hpp-openhrp-${VERSION}
VERSION=	1.6.2

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-openhrp/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}hppOpenHRP

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Basic classes used as interfaces with OpenHRP(tm).

USE_LANGUAGES+= c c++

GNU_CONFIGURE=	yes

CONFIGURE_ARGS+=	--with-openhrp=${PREFIX.OpenHRP}

DOXYGEN_PLIST_DIR+=	share/doc/hppOpenHRP

# options
PKG_OPTIONS_OPTIONAL_GROUPS+=	verbose
PKG_OPTIONS_GROUP.verbose=	verbose1 verbose2

PKG_OPTION_DESCR.verbose1=	Set the level of verbosity to 1
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

PKG_OPTION_DESCR.verbose2=	Set the level of verbosity to 2
PKG_OPTION_SET.verbose2:=	CXXFLAGS+=-DDEBUG=2

include ../../mk/sysdep/doxygen.mk
include ../../simulation/openhrp/depend.mk
include ../../robots/hrp2-14/depend.mk
include ../../path/hpp-core/depend.mk
include ../../devel/jrl-modelloader/depend.mk
include ../../middleware/omniORB/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
