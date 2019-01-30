# robotpkg Makefile for:	graphics/hpp-gepetto-viewer
# Created:			Florent Lamiraux on Mon, 9 Mar 2015
#

HPP_PACKAGE=		hpp-gepetto-viewer
HPP_VERSION=		4.3.1

CATEGORIES=		graphics
HPP_COMMENT=		Bridge between hpp-corbaserver and gepetto-viewer-corba

include ../../meta-pkgs/hpp/Makefile.common

CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

include ../../graphics/gepetto-viewer-corba/depend.mk
include ../../mapping/octomap/depend.mk
include ../../path/hpp-corbaserver/depend.mk
include ../../path/hpp-util/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
