# robotpkg Makefile for:	devel/hpp-kwsplus
# Created:			Anthony Mallet on Fri, 13 Jul 2007
#

HPP_PACKAGE=		hpp-kwsplus
HPP_VERSION=		2.3
PKGREVISION=
MASTER_REPOSITORY=	git git@github.com:laas/hpp-kwsplus

CATEGORIES=		devel
HPP_COMMENT=		Helper functions for KineoWorks(tm) package.
LICENSE=		cnrs-hpp-closed-source

HPP_BUILD_SYSTEM=	cmake

include ../../meta-pkgs/hpp/Makefile.common

# Options
PKG_SUPPORTED_OPTIONS+=	verbose1
PKG_OPTION_DESCR.verbose1=	Define level of verbosity
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

include ../../devel/hpp-kwsio/depend.mk
include ../../math/boost-numeric-bindings-v1/depend.mk
include ../../math/lapack/depend.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/kineoworks.mk
include ../../mk/sysdep/latex.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
