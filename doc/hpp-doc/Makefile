# robotpkg Makefile for:	doc/hpp-doc
# Created:			Anthony Mallet on Tue, 19 Feb 2008
#

DISTNAME=	hpp-doc-${VERSION}
PKGNAME=	hpp-doc-${VERSION}
VERSION=	3.0.0

CATEGORIES=	doc
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-doc/}
MASTER_REPOSITORY= ${MASTER_REPOSITORY_JRL}doc/hpp-doc

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=
COMMENT=	HPP Project documentation.
LICENSE=	gnu-lgpl-v3

GNU_CONFIGURE=	yes
DYNAMIC_PLIST_DIRS+=	share/doc/hpp-doc

# options
PKG_SUPPORTED_OPTIONS+=	hpp-core

PKG_OPTION_DESCR.hpp-core=	Install hpp-core package if needed
define PKG_OPTION_SET.hpp-core
  DEPENDS+=		hpp-core>=3.0:../../path/hpp-core
endef

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/asciidoc.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/source-highlight.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
