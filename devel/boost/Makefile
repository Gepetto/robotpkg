#
# Copyright (c) 2008,2010 LAAS/CNRS
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
# $NetBSD: Makefile.common,v 1.9 2006/11/10 17:41:13 tv Exp $

BOOST_PACKAGE=	meta-pkg
BOOST_COMMENT=	(meta package)

include Makefile.common

CATEGORIES+=	devel
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.boost.org/
COMMENT=	Free, peer-reviewed portable C++ source libraries

META_PACKAGE=	yes

DEPEND_ABI.boost-jam?=		boost-jam>=${BOOST_VERSION}
DEPEND_ABI.boost-doc?=		boost-doc>=${BOOST_VERSION}
DEPEND_ABI.boost-headers?=	boost-headers>=${BOOST_VERSION}
DEPEND_ABI.boost-libs?=		boost-libs>=${BOOST_VERSION}

include ../../devel/boost-jam/depend.mk
include ../../devel/boost-docs/depend.mk
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../mk/robotpkg.mk
