# $LAAS: Makefile 2008/12/29 16:24:21 tho $
#
# Copyright (c) 2007-2008 LAAS/CNRS
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
#                                       Anthony Mallet on Mon Aug 27 2007
#

DISTNAME=	hppOpenHRP-${VERSION}
PKGNAME=	hpp-openhrp-${VERSION}
VERSION=	1.6.2

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-openhrp/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}hppOpenHRP

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Basic classes used as interfaces with OpenHRP(tm).

USE_LANGUAGES+= c c++

GNU_CONFIGURE=	yes

CONFIGURE_ARGS+=	--with-openhrp=${PREFIX.OpenHRP}

DOXYGEN_PLIST_DIR+=	share/doc/hppOpenHRP

# options
PKG_OPTIONS_OPTIONAL_GROUPS+=	verbose
PKG_OPTIONS_GROUP.verbose=	verbose1 verbose2

PKG_OPTION_DESCR.verbose1=	Set the level of verbosity to 1
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

PKG_OPTION_DESCR.verbose2=	Set the level of verbosity to 2
PKG_OPTION_SET.verbose2:=	CXXFLAGS+=-DDEBUG=2

include ../../architecture/openhrp/depend.mk
include ../../robots/hrp2-14/depend.mk
include ../../path/hpp-core/depend.mk
include ../../devel/jrl-modelloader/depend.mk
include ../../devel/omniORB/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
