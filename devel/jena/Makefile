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
#                                          Séverin Lemaignan on Wed Jun  3 2009
#

DISTNAME=	jena-2.6.0
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=jena/}
EXTRACT_SUFX=	.zip

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://jena.sourceforge.net/index.html
COMMENT=	Java framework for building Semantic Web applications

NO_CONFIGURE=	yes
BUILD_TARGET=	main

WRKSRC=		${WRKDIR}/Jena-2.6.0
USE_LANGUAGES=	java

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  BUILD_TARGET+=	javadoc-all
  do-install: jena-install-doc
endef

include ../../mk/sysdep/ant.mk
include ../../lang/sun-jre6/depend.mk
include ../../mk/robotpkg.mk

do-install: jena-install-lib
	@:

.PHONY: jena-install-lib
jena-install-lib:
	cd ${WRKSRC}/lib && ${PAX} -rwp ma *.jar ${PREFIX}/java/jena/lib/

.PHONY: jena-install-doc
jena-install-doc:
	cd ${WRKSRC}/doc && ${PAX} -rwp ma . ${PREFIX}/share/doc/jena/
