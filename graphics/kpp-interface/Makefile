# $LAAS: Makefile 2008/05/25 13:22:21 tho $
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

DISTNAME=	kppinterface-${VERSION}
PKGNAME=	kpp-interface-${VERSION}
VERSION=	1.6

CATEGORIES=	graphics
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}kppInterface
MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Graphical user interface for HPP libraries.

USE_LANGUAGES+= c c++

GNU_CONFIGURE=	yes

# options
PKG_SUPPORTED_OPTIONS+=	verbose1
PKG_OPTION_DESCR.verbose1=	Define level of verbosity
PKG_OPTION_SET.verbose1:=	CXXFLAGS+=-DDEBUG=1

include ../../devel/hpp-kwsplus/depend.mk
include ../../devel/hpp-corbaserver/depend.mk
include ../../path/kineo-pp/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
