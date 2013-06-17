# robotpkg Makefile for:	motion/softMotion-libs
# Created:			Xavier Broquere on Fri, 26 Feb 2010
#
VERSION=		3.12
DISTNAME=		softMotion-libs-${VERSION}
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=softMotion-libs/}
MASTER_REPOSITORY=      git ssh://trac.laas.fr/git/robots/softMotion-libs

CATEGORIES=		motion
COMMENT=		SoftMotion Planner Library
LICENSE=		gnu-lgpl-v3
MAINTAINER=		wuwei.he@laas.fr
NOT_FOR_PLATFORM=

# tcl option
PKG_SUPPORTED_OPTIONS+=	tcl
PKG_OPTION_DESCR.tcl?=	Enable the TCL interface

define PKG_OPTION_SET.tcl
  CMAKE_ARGS+=		-DWITH_TCL=1
  include ../../devel/swig/depend.mk
  include ../../mk/sysdep/libxml2.mk
  include ../../mk/sysdep/tcl.mk
endef

include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
