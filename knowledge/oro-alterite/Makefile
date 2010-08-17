# robotpkg Makefile for:	knowledge/oro-alterite
# Created:			Séverin Lemaignan on Mon, 22 Mar 2010
#

PLUGIN_NAME=		alterite

PKGNAME=		oro-${PLUGIN_NAME}-1.0

DISTNAME=		oro-server-0.7.4
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=oro-server/}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/oro-server

CATEGORIES=	knowledge
MAINTAINER=	severin.lemaignan@laas.fr
HOMEPAGE=	http://homepages.laas.fr/slemaign/oro-server
COMMENT=	A plugin for oro-server that enables multiple cognitive models for \
different agents.

NO_CONFIGURE=	yes
BUILD_DIRS= plugins/${PLUGIN_NAME}
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


include ../../knowledge/oro-server/depend.mk
include ../../mk/robotpkg.mk

