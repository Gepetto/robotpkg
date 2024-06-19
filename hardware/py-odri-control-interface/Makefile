# robotpkg Makefile for:	hardware/py-odri-control-interface
# Created:			Olivier Stasse on Tue, 7 May 2024
#

VERSION=		1.0.1
NAME=			odri-control-interface
ORG=			open-dynamic-robot-initiative

CATEGORIES=		hardware
HOMEPAGE=		${MASTER_SITE_GITHUB:=${ORG}/odri_control_interface}
COMMENT=		Open Dynamic Robot Initiative Control Interface
LICENSE=		modified-bsd

USE_PYTHON=		true
USE_BOOST_LIBS=		python

include ../../devel/jrl-cmakemodules/Makefile.common

WRKSRC=			${WRKDIR}/$(subst -,_,${NAME})-${VERSION}
CMAKE_ARGS+=		-DINSTALL_DOCUMENTATION=OFF

DEPEND_ABI.cmake+=	cmake>=3.14

include ../../hardware/py-odri-master-board-sdk/depend.mk
include ../../math/py-eigenpy/depend.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/yaml-cpp.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
