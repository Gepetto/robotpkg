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
#                                      Anthony Mallet on Fri Oct 10 2008
#

# Borrowed from NetBSD pkgsrc,
# $NetBSD: Makefile,v 1.11 2008/05/09 12:50:31 drochner Exp $

BOOST_PACKAGE=		libs
BOOST_COMMENT=		(binary libraries)
BOOST_CONFIG=		installed

include ../../devel/boost/Makefile.common

BJAM_ARGS+=		--without-python

BUILD_LOG_ETA=		
INSTALL_LOG_ETA=	

include ../../devel/boost-jam/depend.mk
include ../../archivers/bzip2/depend.mk
include ../../archivers/zlib/depend.mk
include ../../mk/robotpkg.mk

do-build: bjam-build
	@${TRUE}

do-install: boost-install-libs
	@${TRUE}
