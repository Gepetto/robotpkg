# robotpkg Makefile for:	path/hpp-core
# Created:			Anthony Mallet on Fri, 13 Jul 2007
#

HPP_PACKAGE=		hpp-core
HPP_VERSION=		2.4
PKGREVISION=		2
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}/algo/${HPP_PACKAGE}

CATEGORIES=	path
HPP_COMMENT=	interface with KineoWorks(tm)
LICENSE=	cnrs-hpp-closed-source

HPP_BUILD_SYSTEM=	cmake
include ../../meta-pkgs/hpp/Makefile.common

include ../../devel/hpp-model/depend.mk
include ../../devel/hpp-util/depend.mk
include ../../devel/hpp-kwsplus/depend.mk
include ../../mk/robotpkg.mk
