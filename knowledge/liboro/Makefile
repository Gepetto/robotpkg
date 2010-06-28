#
# Copyright (c) 2009 LAAS/CNRS
# All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without   fee is hereby granted, provided   that the above  copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
#
#                                          Severin Lemaignan on Thu Jun 04 2009
#

DISTNAME=		liboro-0.7.6
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=liboro/}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/liboro

CATEGORIES=		knowledge
MAINTAINER=		severin.lemaignan@laas.fr
HOMEPAGE=		http://homepages.laas.fr/slemaign/oro-server/oro-server-bindings.html
COMMENT=		C++ interface to the oro-server ontology server.

USE_LANGUAGES+=		c c++
BUILD_TARGET=		all
INSTALL_TARGET=		install

CMAKE_ARGS+=		-DLIBORO_SOURCE_DIR=${WRKSRC}
CMAKE_ARGS+=		-DBOOST_INCLUDEDIR=${PREFIX.boost-headers}/include
CMAKE_ARGS+=		-DBOOST_LIBRARYDIR=${PREFIX.boost-libs}/lib

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  BUILD_TARGET+=	doc
  INSTALL_TARGET+=	install-doc
  DOXYGEN_PLIST_DIR+=	share/doc/liboro
  include ../../mk/sysdep/doxygen.mk
endef

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
