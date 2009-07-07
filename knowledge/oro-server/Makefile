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
#                                          Séverin Lemaignan on Mon Jul 6 2009
#

DISTNAME=		oro-server-0.4.2
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=oro-server/}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/oro-server

CATEGORIES=	knowledge
MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://softs.laas.fr/openrobots/
COMMENT=	An ontology server for robotics, written in Java

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
  BUILD_TARGET+=	doc
  INSTALL_TARGET+=	install-doc
endef


include ../../lang/sun-jre6/depend.mk
include ../../knowledge/jena/depend.mk
include ../../knowledge/pellet/depend.mk
include ../../devel/libjyarp/depend.mk
include ../../mk/robotpkg.mk

