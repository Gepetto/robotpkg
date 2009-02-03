# $LAAS: Makefile 2009/02/03 16:27:02 mallet $
#
# Copyright (c) 2007-2009 LAAS/CNRS
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
#                                     Florent Lamiraux on Wed Oct 10 2007
#

DISTNAME=	hrp2_14-1.5

CATEGORIES=	robots
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hrp2_14/}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Data and functions specific to HRP2-14.

# dependency to kineo
PKG_SUPPORTED_OPTIONS+=	with-kineo
PKG_SUGGESTED_OPTIONS+=	with-kineo

PKG_OPTION_DESCR.with-kineo=	Provide configuration computations
define PKG_OPTION_SET.with-kineo
	CMAKE_ARGS+=	-DWITH_KINEO=true
	include ../../path/kineo-pp/depend.mk
endef

USE_LANGUAGES+=		c++
DOXYGEN_PLIST_DIR+=	share/doc/hrp2_14

include ../../mk/sysdep/cmake.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
