# robotpkg Makefile for:	middleware/orocos-rtt
# Created:			Arnaud Degroote on Thu, 22 Apr 2010
#

OROCOS_VERSION=		1.10.4
DISTNAME=		orocos-rtt-${OROCOS_VERSION}-src
PKGNAME=		orocos-rtt-${OROCOS_VERSION}
CATEGORIES=		middleware
MASTER_SITES=		http://www.orocos.org/stable/rtt/v${OROCOS_VERSION}/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.orocos.org/rtt
COMMENT=		The Orocos Real-Time Toolkit
LICENSE=		gnu-gpl-v2

NOT_FOR_PLATFORM=	NetBSD-%
NOT_FOR_PLATFORM+=	Fedora-17-%
NOT_FOR_PLATFORM+=	Ubuntu-12.10-%

DOXYGEN_PLIST_DIR+=	share/doc/liborocos-rtt

CMAKE_ARGS+=	-DBOOST_INCLUDEDIR=${PREFIX.boost-headers}/include

PKG_SUPPORTED_OPTIONS+=	corba

define PKG_OPTION_SET.corba
  CMAKE_ARGS+=		-DENABLE_CORBA=ON -DCORBA_IMPLEMENTATION=OMNIORB

  include ../../middleware/omniORB/depend.mk
endef

WRKSRC=			${WRKDIR}/orocos-rtt-${OROCOS_VERSION}

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/xerces-c.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
