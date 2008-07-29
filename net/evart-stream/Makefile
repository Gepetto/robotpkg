# $LAAS: Makefile 2008/07/29 18:06:28 mallet $
#
# Copyright (c) 2008 LAAS/CNRS
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

VERSION=		1.3
DISTNAME=		evart-stream-${VERSION}

CATEGORIES=		net
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=evart/}

MAINTAINER=		mallet@laas.fr
#HOMEPAGE=		
COMMENT=		EVa Real-Time Software data streaming server.

GNU_CONFIGURE=          yes
CONFIGURE_ARGS+=	--with-sdk-include=${PREFIX.evart-sdk}/include
CONFIGURE_ARGS+=	--with-sdk-lib=${PREFIX.evart-sdk}/bin

DEPEND_METHOD.evart-client+=	build

include ../../devel/evart-sdk/depend.mk
include ../../net/evart-client/depend.mk
include ../../cross/i386-mingw32/depend.mk
include ../../mk/robotpkg.mk
