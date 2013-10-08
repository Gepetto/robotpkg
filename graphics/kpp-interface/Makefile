# robotpkg Makefile for:	graphics/kpp-interface
# Created:			Anthony Mallet on Mon, 27 Aug 2007
#

HPP_PACKAGE=	kpp-interface
HPP_VERSION=	2.1.1
PKGREVISION=

CATEGORIES=	graphics
MASTER_REPOSITORY=	git git@github.com:laas/kpp-interface.git
HPP_COMMENT=	Graphical user interface for HPP libraries.
LICENSE=	gnu-lgpl-v3
HPP_BUILD_SYSTEM= 	cmake

post-install:
	$(MAKE) -C ${WRKSRC} license

include ../../meta-pkgs/hpp/Makefile.common
include ../../devel/hpp-corbaserver/depend.mk
include ../../mk/sysdep/kineoworks.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/sysdep/glu.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
