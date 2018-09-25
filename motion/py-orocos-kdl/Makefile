# robotpkg Makefile for:	motion/py-orocos-kdl
# Created:			Anthony Mallet on Thu, 14 Aug 2014
#

VERSION=	1.4.0
DISTNAME=	${PKGTAG.python-}orocos-kdl-${VERSION}
DISTFILES=	${VERSION}${EXTRACT_SUFX}
CATEGORIES=	motion
DIST_SUBDIR=	orocos-kdl
DIST_URL=	orocos/orocos_kinematics_dynamics/archive/v
MASTER_SITES=	${MASTER_SITE_GITHUB:=${DIST_URL}}

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.orocos.org/kdl
COMMENT=	Python bindings for orocos-kdl
LICENSE=	gnu-lgpl-v2
CONFLICTS+=	py[0-9][0-9]-orocos-kdl-[0-9]*

WRKSRC=\
  ${WRKDIR}/orocos_kinematics_dynamics-${VERSION}/python_orocos_kdl

CMAKE_ARGS+=	-DPYTHON_SITE_PACKAGES_INSTALL_DIR=${PREFIX}/${PYTHON_SITELIB}

DEPEND_ABI.orocos-kdl=		orocos-kdl-${VERSION}

include ../../motion/orocos-kdl/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/py-sip.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
