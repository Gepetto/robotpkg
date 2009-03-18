# $LAAS: Makefile 2008/05/25 13:21:17 tho $
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
#                                       Anthony Mallet on Tue Feb 19 2008
#

DISTNAME=	hppdoc-${VERSION}
PKGNAME=	hpp-doc-${VERSION}
VERSION=	1.2

CATEGORIES=	doc
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	HPP Project documentation.

GNU_CONFIGURE=	yes

# options
PKG_SUPPORTED_OPTIONS+=	hpp-core

PKG_OPTION_DESCR.hpp-core=	Install hpp-core package if needed
define PKG_OPTION_SET.hpp-core
  DEPENDS+=		hpp-core>=1.0:../../path/hpp-core
endef

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
