# robotpkg Makefile for:	architecture/orocos-ocl
# Created:			Arnaud Degroote on Thu, 22 Apr 2010
#

OROCOS_VERSION=		1.10.2
DISTNAME=		orocos-ocl-${OROCOS_VERSION}-src
PKGNAME=		orocos-ocl-${OROCOS_VERSION}
CATEGORIES=		architecture
MASTER_SITES=		http://www.orocos.org/stable/ocl/v${OROCOS_VERSION}/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.orocos.org/ocl
COMMENT=		The Orocos Component Library
LICENSE=		gnu-lgpl-v2.1


WRKSRC=			${WRKDIR}/orocos-ocl-${OROCOS_VERSION}

PKG_SUPPORTED_OPTIONS+=	corba

define PKG_OPTION_SET.corba
  CMAKE_ARGS+=			-DCORBA_ENABLED=ON
  DEPEND_ABI.orocos-rtt+=	orocos-rtt~corba
endef
define PKG_OPTION_UNSET.corba
  CMAKE_ARGS+=			-DCORBA_ENABLED=OFF
endef

include ../../middleware/orocos-rtt/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/readline.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
