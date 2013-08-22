# robotpkg Makefile for:	devel/orocos-logcpp
# Created:			Arnaud Degroote on Wed, 21 Aug 2013
#

OROCOS_VERSION=	2.6.0
DISTNAME=		orocos-toolchain-${OROCOS_VERSION}-src
PKGNAME=		orocos-log4cpp-${OROCOS_VERSION}
CATEGORIES=		devel
MASTER_SITES=	http://people.mech.kuleuven.be/~orocos/pub/stable/toolchain/v${OROCOS_VERSION}/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.orocos.org/toolchain
COMMENT=		A C++ logging library, with real-time support
LICENSE=		gnu-lgpl-v2.1

WRKSRC=			${WRKDIR}/orocos-toolchain-${OROCOS_VERSION}/log4cpp

include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
