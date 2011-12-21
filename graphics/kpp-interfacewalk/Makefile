# robotpkg Makefile for:	graphics/kpp-interfacewalk
# Created:			Anthony Mallet on Wed, 29 Aug 2007
#

DISTNAME=	kpp-interfacewalk-${VERSION}
PKGNAME=	kpp-interfacewalk-${VERSION}
VERSION=	1.13

CATEGORIES=	graphics
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=kpp-interfacewalk/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}kpp/kpp-interfacewalk

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=
COMMENT=	Graphical user interface for hppWalkPlanner libraries.
LICENSE=	cnrs-hpp-closed-source

USE_LANGUAGES+= c c++

GNU_CONFIGURE=	yes
DOXYGEN_PLIST_DIR+=share/doc/kpp-interfacewalk

# options
PKG_SUPPORTED_OPTIONS+=	verbose
PKG_OPTION_DESCR.verbose=	Compile in verbose mode
PKG_OPTION_SET.verbose:=	CPPFLAGS+=-DHPP_DEBUG

include ../../mk/sysdep/doxygen.mk
include ../../path/hpp-walkplanner/depend.mk
include ../../graphics/kpp-interface/depend.mk
include ../../robots/hrpsys-jrl/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
