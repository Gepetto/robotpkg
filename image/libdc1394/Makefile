# $LAAS: Makefile 2010/02/23 15:31:16 mallet $
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
#                                      Anthony Mallet on Sun Jan 28 2007
#

DISTNAME=		libdc1394-2.1.2
CATEGORIES=		image
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=libdc1394/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://sourceforge.net/projects/libdc1394/
COMMENT=		Programming interface to control IEEE 1394 based cameras

ONLY_FOR_PLATFORM=	Linux-% Darwin-%-i386

GNU_CONFIGURE=		yes

include ../../mk/robotpkg.prefs.mk
ifeq (Linux,${OPSYS})
  include ../../image/libraw1394/depend.mk
endif
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
