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
#                                          Séverin Lemaignan on Tue Nov 16 2009
#

DISTNAME=	pellet-2.0.0
PKGVERSION=	2.0.0
PKGNAME=	pellet-${PKGVERSION}
MASTER_SITES=	http://clarkparsia.com/pellet/downloads/
EXTRACT_SUFX=	.zip

CATEGORIES=	knowledge
MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://clarkparsia.com/pellet
COMMENT=	An open source reasoner for OWL 2 DL in Java.

NO_CONFIGURE=	yes
NO_BUILD= yes

WRKSRC=		${WRKDIR}/pellet-2.0.0
USE_LANGUAGES=	java

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  do-install: pellet-install-doc
endef

include ../../lang/sun-jre6/depend.mk
include ../../knowledge/jena/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../mk/robotpkg.mk

do-install: pellet-install-lib
	@:

.PHONY: pellet-install-lib
pellet-install-lib:
	cd ${WRKSRC}/lib && ${PAX} -rwp ma pellet-*.jar aterm-*.jar xsdlib/*.jar ${PREFIX}/java/pellet/lib/

.PHONY: pellet-install-doc
pellet-install-doc:
	cd ${WRKSRC}/doc && ${PAX} -rwp ma . ${PREFIX}/share/doc/pellet/
