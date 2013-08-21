# robotpkg Makefile for:	middleware/orocos-rtt
# Created:			Arnaud Degroote on Thu, 22 Apr 2010
#

OROCOS_VERSION=	2.6.0
DISTNAME=		orocos-toolchain-${OROCOS_VERSION}-src
PKGNAME=		orocos-rtt-${OROCOS_VERSION}
CATEGORIES=		middleware
MASTER_SITES=	http://people.mech.kuleuven.be/~orocos/pub/stable/toolchain/v${OROCOS_VERSION}/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.orocos.org/rtt
COMMENT=		The Orocos Real-Time Toolkit
LICENSE=		gnu-gpl-v2

DYNAMIC_PLIST_DIRS+=	share/doc/liborocos-rtt

CMAKE_ARGS+=	-DBOOST_INCLUDEDIR=${PREFIX.boost-headers}/include
CMAKE_ARGS+=	-DBOOST_LIBDIR=${PREFIX.boost-headers}/lib

DEPEND_ABI.boost-libs=boost-libs>=1.38
DEPEND_ABI.boost-headers=boost-headers>=1.38

PKG_SUPPORTED_OPTIONS+=	corba

define PKG_OPTION_SET.corba
  CMAKE_ARGS+=		-DENABLE_CORBA=ON -DCORBA_IMPLEMENTATION=OMNIORB

  include ../../middleware/omniORB/depend.mk
endef

WRKSRC=			${WRKDIR}/orocos-toolchain-${OROCOS_VERSION}/rtt

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/xerces-c.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
