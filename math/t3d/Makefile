# $LAAS: Makefile 2010/07/01 17:06:27 mallet $
#
# Copyright (c) 2007-2010 LAAS/CNRS
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
#                                      Anthony Mallet on Fri Feb  2 2007
#

DISTNAME=	libt3d-2.6
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=libt3d/}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=
COMMENT=	3d transformations, matrices and vector package.
LICENSE=	2-clause-bsd

USE_LANGUAGES+=	c c++
GNU_CONFIGURE=	yes

BUILD_TARGET=	all
INSTALL_TARGET=	install

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  BUILD_TARGET+=	doc
  INSTALL_TARGET+=	install-doc
  DOXYGEN_PLIST_DIR+=	share/doc/libt3d
  include ../../mk/sysdep/doxygen.mk
endef

include ../../mk/robotpkg.mk
