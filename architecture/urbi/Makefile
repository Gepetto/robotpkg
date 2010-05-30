# $LAAS: Makefile 2009/03/30 10:58:01 mallet $
#
# Copyright (c) 2008-2009 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice  and this list of  conditions in the documentation   and/or
#      other materials provided with the distribution.
#
#                                       Anthony Mallet on Wed Sep 17 2008
#

DISTNAME=	urbi-sdk-${VERSION}
PKGNAME=	urbi-${VERSION}
VERSION=	2.0.2

CATEGORIES=	architecture
MASTER_SITES=	http://www.gostai.com/static/downloads/
#MASTER_REPOSITORY=

MAINTAINER=	kernel@lists.gostai.com
HOMEPAGE=	http://www.gostai.com/
COMMENT=	Urbi middleware for robotics.

USE_LANGUAGES+= c c++

GNU_CONFIGURE=	yes

# Enable release mode.
CONFIGURE_ARGS+=	--enable-compilation-mode=speed
# Generate documentation.
CONFIGURE_ARGS+=	--enable-doc-sections=all

include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
