# robotpkg Makefile for:	knowledge/jena
# Created:			Anthony Mallet on Fri, 12 Jun 2009
#

DISTNAME=	jena-${PKGVERSION_NOREV}
PKGVERSION=	2.6.4
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=jena/}
EXTRACT_SUFX=	.zip

CATEGORIES=	knowledge
LICENSE=	modified-bsd
MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://jena.sourceforge.net/index.html
COMMENT=	Java framework for building Semantic Web applications

NO_CONFIGURE=	yes
NO_BUILD= yes

WRKSRC=		${WRKDIR}/Jena-${PKGVERSION_NOREV}

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  BUILD_TARGET+=	javadoc-all
  do-install: jena-install-doc
endef

include ../../pkgtools/pax/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/sysdep/java.mk
include ../../mk/robotpkg.mk

do-install: jena-install-lib
	@:

.PHONY: jena-install-lib
jena-install-lib:
	${INSTALL} -d ${PREFIX}/java/jena
	${INSTALL} -d ${PREFIX}/java/jena/lib
	cd ${WRKSRC}/lib && ${PAX} -rwp ma *.jar ${PREFIX}/java/jena/lib/
	${LN} -sf ${PREFIX}/java/jena/lib/${DISTNAME}.jar ${PREFIX}/java/jena/lib/${PKGBASE}.jar

.PHONY: jena-install-doc
jena-install-doc:
	${INSTALL} -d ${PREFIX}/share/doc/jena/
	cd ${WRKSRC}/doc && ${PAX} -rwp ma . ${PREFIX}/share/doc/jena/
