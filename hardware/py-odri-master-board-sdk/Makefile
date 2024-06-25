# robotpkg Makefile for:	hardware/py-odri-master-board-sdk
# Created:			Olivier Stasse on Sun, 7 Jan 2024
#

NAME=			odri-master-board-sdk
ORG=			open-dynamic-robot-initiative
VERSION=		1.0.7

CATEGORIES=		hardware
HOMEPAGE=\
  ${MASTER_SITE_GITHUB:=${ORG}/master-board/tree/master/sdk/master_board_sdk}
COMMENT=		Open Dynamic Robot Initiative master-board libraries
LICENSE=		modified-bsd

ONLY_FOR_PLATFORM+=     Linux-% # this uses linux socket filters

USE_PYTHON=		true
USE_BOOST_LIBS=		python

include ../../devel/jrl-cmakemodules/Makefile.common

CMAKE_ARGS+=		-DINSTALL_DOCUMENTATION=OFF
CMAKE_ARGS+=		-DBUILD_TESTING=OFF # requires catch2 dependency

DEPEND_ABI.cmake+=	cmake>=3.14

include ../../mk/sysdep/boost-libs.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
