# robotpkg Makefile for:	devel/hpp-util
# Created:			Thomas Moulard on Wed, 8 Sep 2010
#

HPP_PACKAGE=	        hpp-util
VERSION=		0.4c
PKGREVISION=		1
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB_LAAS}${HPP_PACKAGE}

CATEGORIES=		devel
COMMENT=		Technical tools shared amongst HPP
LICENSE=		gnu-gpl-v3

include ../../meta-pkgs/hpp/Makefile.cmake

# boost-1.47.0 has -Wconversion warnings in date_time/posix_time/posix_time.hpp
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

include ../../mk/robotpkg.mk
