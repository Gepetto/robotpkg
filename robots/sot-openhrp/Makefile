# robotpkg Makefile for:	robots/sot-openhrp
# Created:			florent on Wed, 10 Oct 2007
#

DISTNAME=	sot-openhrp-${VERSION}
PKGNAME=	sot-openhrp-${VERSION}
VERSION=	2.5

CATEGORIES=	robots
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=sot-openhrp/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB_JRL}sot-openhrp

MAINTAINER=	hpp@laas.fr
COMMENT=	hrpsys plugin for the stack of tasks
LICENSE=	gnu-lgpl-v3

USE_LANGUAGES+=	c c++
DOXYGEN_PLIST_DIR+=	share/doc/sot-openhrp

# options
PKG_SUPPORTED_OPTIONS+=	hrp2-laas hrp2-jrl
PKG_SUGGESTED_OPTIONS+=	hrp2-laas

PKG_OPTION_DESCR.hrp2-laas=	Compile plug-in for HRP2-14
define PKG_OPTION_SET.hrp2-laas
  CMAKE_ARGS+= -DROBOT=HRP2LAAS
endef

PKG_OPTION_DESCR.hrp2-jrl=	Compile plug-in for HRP2-10
define PKG_OPTION_SET.hrp2-jrl
  CMAKE_ARGS+= -DROBOT=HRP2JRL
endef

PKG_OPTIONS_REQUIRED_GROUPS=	robot
PKG_OPTIONS_GROUP.robot=	hrp2-laas hrp2-jrl

include ../../motion/sot-dynamic/depend.mk
include ../../motion/dynamic-graph-corba/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
