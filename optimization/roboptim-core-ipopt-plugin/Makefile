# robotpkg Makefile for:	optimization/roboptim-core-ipopt-plugin
# Created:			florent on Sat, 9 May 2009
#

DISTNAME=	roboptim-core-ipopt-plugin-${VERSION}
PKGNAME=	roboptim-core-ipopt-plugin-${VERSION}
VERSION=	0.2

CATEGORIES=	optimization
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=roboptim/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}roboptim/core

MAINTAINER=	roboptim-user@lists.sourceforge.net
HOMEPAGE=	http://sourceforge.net/projects/roboptim/
COMMENT=	plug-in linking ipopt to roboptim-core
LICENSE=	cpl

USE_LANGUAGES+= c c++

DOXYGEN_PLIST_DIR+=	share/doc/roboptim-core-ipopt-plugin

GNU_CONFIGURE=	yes

# --------------------------------------------------------------------

include ../../optimization/roboptim-core/depend.mk
include ../../optimization/ipopt/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/latex.mk
include ../../mk/robotpkg.mk
