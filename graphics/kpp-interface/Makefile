# robotpkg Makefile for:	graphics/kpp-interface
# Created:			Anthony Mallet on Mon, 27 Aug 2007
#

DISTNAME=	kppInterface-${VERSION}
PKGNAME=	kpp-interface-${VERSION}
VERSION=	1.9.4

CATEGORIES=	graphics
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=kpp-interface/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}kpp/kpp-interface
MAINTAINER=	hpp@laas.fr
#HOMEPAGE=
COMMENT=	Graphical user interface for HPP libraries.
LICENSE=	cnrs-hpp-closed-source

USE_LANGUAGES+= c c++

GNU_CONFIGURE=	yes
DOXYGEN_PLIST_DIR+=share/doc/kppInterface

# options
PKG_SUPPORTED_OPTIONS+=	verbose1
PKG_OPTION_DESCR.verbose1=	Define level of verbosity
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

include ../../devel/hpp-corbaserver/depend.mk
include ../../path/kineo-pp/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/sysdep/glu.mk
include ../../mk/robotpkg.mk
