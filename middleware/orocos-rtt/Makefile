# robotpkg Makefile for:	middleware/orocos-rtt
# Created:			Arnaud Degroote on Thu, 22 Apr 2010
#

OROCOS_PKG=		rtt
CATEGORIES=		middleware
DISTINFO_FILE=		${CURDIR}/distinfo
PKGREVISION=		2

include  ../../meta-pkgs/orocos-toolchain/Makefile.common

HOMEPAGE=		http://www.orocos.org/rtt
COMMENT=		The Orocos Real-Time Toolkit
LICENSE=		gnu-gpl-v2

NOT_FOR_PLATFORM=	NetBSD-%

DYNAMIC_PLIST_DIRS+=	share/doc/liborocos-rtt

DEPEND_ABI.boost-libs=boost-libs>=1.38
DEPEND_ABI.boost-headers=boost-headers>=1.38

PKG_SUPPORTED_OPTIONS+=	corba

define PKG_OPTION_SET.corba
  CMAKE_ARGS+=		-DENABLE_CORBA=ON -DCORBA_IMPLEMENTATION=OMNIORB

  include ../../middleware/omniORB/depend.mk
endef

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/xerces-c.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
