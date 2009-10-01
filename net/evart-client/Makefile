# $LAAS: Makefile 2009/10/01 19:13:28 mallet $
#
# Copyright (c) 2008-2009 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
#                                      Anthony Mallet on Tue Jul 15 2008
#

VERSION=		1.5
DISTNAME=		evart-client-${VERSION}

CATEGORIES=		net
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=evart/}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/evart-client

MAINTAINER=		mallet@laas.fr
#HOMEPAGE=		
COMMENT=		EVa Real-Time Software data streaming API.

GNU_CONFIGURE=          yes
BUILD_TARGET=		all
INSTALL_TARGET=		install

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  BUILD_TARGET+=	doc
  INSTALL_TARGET+=	install-doc
  DOXYGEN_PLIST_DIR+=	share/doc/evart-client
  include ../../mk/sysdep/doxygen.mk
endef

include ../../mk/robotpkg.mk
