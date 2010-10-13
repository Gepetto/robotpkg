# robotpkg Makefile for:	doc/hpp-doc
# Created:			Anthony Mallet on Tue, 19 Feb 2008
#

DISTNAME=	hpp-doc-${VERSION}
PKGNAME=	hpp-doc-${VERSION}
VERSION=	2.0.2

CATEGORIES=	doc
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-doc/}
MASTER_REPOSITORY= ${MASTER_REPOSITORY_JRL}doc/hpp-doc

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	HPP Project documentation.
LICENSE=	cnrs-hpp-closed-source

GNU_CONFIGURE=	yes

# options
PKG_SUPPORTED_OPTIONS+=	hpp-core

PKG_OPTION_DESCR.hpp-core=	Install hpp-core package if needed
define PKG_OPTION_SET.hpp-core
  DEPENDS+=		hpp-core>=1.0:../../path/hpp-core
endef

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/asciidoc.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
