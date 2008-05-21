# $Id: Makefile 2008/04/24 16:12:30 mallet $

DISTNAME=	kppinterface-${VERSION}
PKGNAME=	kpp-interface-${VERSION}
VERSION=	1.3

CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Graphical user interface for HPP libraries.

DEPENDS+=	hpp-corbaserver>=1.2:../../devel/hpp-corbaserver

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_PKG_CONFIG=	yes

#options
PKG_SUPPORTED_OPTIONS+=	verbose1
PKG_OPTION_DESCR.verbose1=	Define level of verbosity
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

include ../../devel/hpp-kwsplus/depend.mk
include ../../path/kineo-pp/depend.mk
include ../../mk/robotpkg.mk
