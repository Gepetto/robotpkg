# robotpkg Makefile for:	knowledge/pellet
# Created:			Séverin Lemaignan on Tue, 7 Jul 2009
#

DISTNAME=	       pellet-2.1.0
PKGVERSION=	       2.1.0
PKGNAME=	       pellet-${PKGVERSION}
MASTER_SITES=	   http://clarkparsia.com/pellet/downloads/
EXTRACT_SUFX=	   .zip

CATEGORIES=	       knowledge
MAINTAINER=	       openrobots@laas.fr
HOMEPAGE=	       http://clarkparsia.com/pellet
COMMENT=	       An open source reasoner for OWL 2 DL in Java.

LICENSE=           gnu-agpl-v3

NO_CONFIGURE=      yes
NO_BUILD=          yes

WRKSRC=		       ${WRKDIR}/${DISTNAME}
USE_LANGUAGES=	   java

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
include ../../pkgtools/install-sh/depend.mk
include ../../mk/robotpkg.mk

do-install: pellet-install-lib
	@:

.PHONY: pellet-install-lib
pellet-install-lib:
	${INSTALL} -d ${PREFIX}/java/pellet
	${INSTALL} -d ${PREFIX}/java/pellet/lib
	cd ${WRKSRC}/lib && ${PAX} -rwp ma pellet-*.jar aterm-*.jar jgrapht/*.jar xsdlib/*.jar ${PREFIX}/java/pellet/lib/

.PHONY: pellet-install-doc
pellet-install-doc:
	${INSTALL} -d ${PREFIX}/share/doc/pellet
	cd ${WRKSRC}/doc && ${PAX} -rwp ma . ${PREFIX}/share/doc/pellet/
