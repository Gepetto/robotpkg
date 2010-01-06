#
# Copyright (c) 2008-2010 CNRS/LAAS
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#

DISTNAME=	libftdi-${PKGVERSION}
PKGVERSION=	0.16
CATEGORIES=	hardware
MASTER_SITES=	http://www.intra2net.com/de/produkte/opensource/ftdi/TGZ/

HOMEPAGE=	http://www.intra2net.com/de/produkte/opensource/ftdi/
MAINTAINER=	openrobots@laas.fr
COMMENT=	interface to ftdi USB device devices

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--without-python-binding

INSTALLATION_DIRS+=	man share/doc/${PKGBASE}

# C++ wrappers option
PKG_SUPPORTED_OPTIONS+=	cxx
PKG_OPTION_DESCR.cxx?=	Build C++ wrappers

define PKG_OPTION_SET.cxx
  CONFIGURE_ARGS+=	--with-boost=${PREFIX.boost-libs}
  include ../../devel/boost-libs/depend.mk
endef
define PKG_OPTION_UNSET.cxx
  CONFIGURE_ARGS+=	--with-boost=no
endef

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  DOXYGEN_PLIST_DIR+=	share/doc/${PKGBASE}
  include ../../mk/sysdep/doxygen.mk

  post-install: install-doc
endef


include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../mk/robotpkg.mk

.PHONY: install-doc
install-doc:
	cd ${WRKSRC}/doc/man && ${PAX} -rwp ma . ${PREFIX}/man
	cd ${WRKSRC}/doc/html && ${PAX} -rwp ma . ${PREFIX}/share/doc/${PKGBASE}
