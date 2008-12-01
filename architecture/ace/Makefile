# $LAAS: Makefile 2008/11/28 16:45:42 mallet $
#
# Copyright (c) 2008 LAAS/CNRS
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
#                                       Anthony Mallet on Wed Jan 23 2008
#

ACE_VERSION=		5.6.7
DISTNAME=		ACE-${ACE_VERSION}
PKGNAME=		ace-${ACE_VERSION}
CATEGORIES=		architecture
MASTER_SITES=		http://download.dre.vanderbilt.edu/previous_versions/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.cs.wustl.edu/~schmidt/ACE.html
COMMENT=		The ADAPTATIVE Communication Environment ACE(tm)

WRKSRC=			${WRKDIR}/ACE_wrappers

GNU_CONFIGURE=		yes
CONFIGURE_DIRS=		build
CONFIGURE_SCRIPT=	../configure
CONFIGURE_ARGS+=	--disable-ssl#		 we don't use ssl right now
CONFIGURE_ARGS+=	--disable-ace-tests

OVERRIDE_DIRDEPTH.pkg-config=	3

BUILD_DIRS=		build

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk

# create the build directory
pre-configure: ace-build-dir

.PHONY: ace-build-dir
ace-build-dir:
	${MKDIR} ${WRKSRC}/build
