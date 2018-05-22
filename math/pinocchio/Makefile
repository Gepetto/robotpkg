# robotpkg Makefile for:	math/pinocchio
# Created:			Olivier Stasse on Thu, 4 Feb 2016
#

VERSION=		1.2.8
DISTNAME=		pinocchio-${VERSION}
MASTER_SITES=\
  ${MASTER_SITE_GITHUB:=stack-of-tasks/pinocchio/releases/download/v${VERSION}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}/stack-of-tasks/${PKGBASE}
CHECKOUT_VCS_OPTS=	--recursive

CATEGORIES=		math
COMMENT=		Efficient rigid body dynamics
HOMEPAGE=		http://stack-of-tasks.github.io/pinocchio/
MAINTAINER=		gepetto@laas.fr
LICENSE=		gnu-lgpl-v3

CMAKE_ARGS+=		-DCMAKE_INSTALL_LIBDIR=lib

CMAKE_ARGS+=		-DBUILD_BENCHMARK=OFF
CMAKE_ARGS+=		-DBUILD_UNIT_TESTS=OFF
CMAKE_ARGS+=		-DBUILD_UTILS=OFF
CMAKE_ARGS+=		-DBUILD_TESTS_WITH_HPP=OFF
CMAKE_ARGS+=		-DBUILD_PYTHON_INTERFACE=OFF
CMAKE_ARGS+=		-DINSTALL_DOCUMENTATION=OFF

USE_BOOST_LIBS=		system filesystem

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../math/eigen3/depend.mk
include ../../path/hpp-fcl/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk

DEPEND_ABI.urdfdom +=	urdfdom>=0.2.3

include ../../mk/robotpkg.mk

# Add revision number to the .pc, as the depend.mk needs DEPEND_ABI>=1.2.7r1
post-configure:
	${RUN} ${STEP_MSG} "Adding revision number to .pc file";	\
	for f in pinocchio.pc include/pinocchio/config.hh; do		\
	  ${MV} -f ${WRKSRC}/$$f ${WRKSRC}/$$f~;			\
	  ${SED}							\
	  -e '/PINOCCHIO_VERSION.*/s//PINOCCHIO_VERSION "${PKGVERSION}"/'\
	  -e '/Version:.*/s//Version: ${PKGVERSION}/'			\
	  <${WRKSRC}/$$f~ >${WRKSRC}/$$f;				\
	done
