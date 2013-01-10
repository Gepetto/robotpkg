# robotpkg Makefile for:	knowledge/pellet
# Created:			Séverin Lemaignan on Tue, 7 Jul 2009
#

VERSION=	2.3.0
DISTNAME=	pellet-${VERSION}
# official MASTER_SITES is http://clarkparsia.com/pellet/download/${DISTNAME},
# but it requires registration (thus preventing automatic download).
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}
EXTRACT_SUFX=	.zip

CATEGORIES=	knowledge
COMMENT=	Open source reasoner for OWL 2 DL in Java
HOMEPAGE=	http://clarkparsia.com/pellet
LICENSE=	gnu-agpl-v3
MAINTAINER=	openrobots@laas.fr

NO_CONFIGURE=		yes
NO_BUILD=		yes
INSTALLATION_DIRS=	java/pellet/lib share/doc/pellet

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  do-install: pellet-install-doc
endef

include ../../knowledge/jena/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/sysdep/java.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

do-install: pellet-install-lib
	@:

.PHONY: pellet-install-lib
pellet-install-lib:
	${RUN} cd ${WRKSRC}/lib && ${INSTALL_LOGFILTER}			\
	${PAX} -v -r -w -p ma						\
		pellet-*.jar aterm-*.jar jgrapht/*.jar xsdlib/*.jar	\
		${PREFIX}/java/pellet/lib/

.PHONY: pellet-install-doc
pellet-install-doc:
	${RUN} cd ${WRKSRC}/doc && ${INSTALL_LOGFILTER}			\
	${PAX} -v -r -w -p ma . ${PREFIX}/share/doc/pellet/
