# robotpkg Makefile for:	knowledge/oro-server
# Created:			Séverin Lemaignan on Mon, 6 Jul 2009
#

DISTNAME=		oro-server-0.7.12
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=oro-server/}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/oro-server

CATEGORIES=	knowledge
LICENSE=	isc
MAINTAINER=	severin.lemaignan@laas.fr
HOMEPAGE=	http://homepages.laas.fr/slemaign/oro-server
COMMENT=	A cognitive kernel for robotics, written in Java

NO_CONFIGURE=	yes
BUILD_TARGET=	oro-server
INSTALL_TARGET=	install

USE_LANGUAGES=	java


MAKE_ENV+= JAVA=${JAVA_HOME}/bin/java
MAKE_ENV+= JAVAC=${JAVA_HOME}/bin/javac
MAKE_ENV+= JAVADOC=${JAVA_HOME}/bin/javadoc
MAKE_ENV+= JAR=${JAVA_HOME}/bin/jar

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  INSTALL_TARGET+=	install-doc
endef


include ../../lang/sun-jdk6/depend.mk
include ../../knowledge/jena/depend.mk
include ../../knowledge/pellet/depend.mk
include ../../mk/robotpkg.mk

