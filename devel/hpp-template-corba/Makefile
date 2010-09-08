# $LAAS: Makefile 2009/04/09 19:08:22 mallet $
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
#                                       Anthony Mallet on Mon Aug 27 2007
#

HPP_PACKAGE=	hpp-template-corba
VERSION=	0.4

CATEGORIES=	devel
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}corba/hpp-template-corba

COMMENT=	Template CORBA server

USE_LANGUAGES+=	c c++
GNU_CONFIGURE=	yes

# --- options --------------------------------------------------------

# hpp-util support
PKG_SUPPORTED_OPTIONS+=	hpp-util
PKG_SUGGESTED_OPTIONS+=	hpp-util

PKG_OPTION_DESCR.hpp-util=	Trigger a dependency to hpp-util
define PKG_OPTION_SET.hpp-util
  CONFIGURE_ARGS+=	--enable-hpp-util
  include ../../devel/hpp/Makefile.common
  include ../../devel/hpp-util/depend.mk
endef

# --------------------------------------------------------------------

include ../../devel/hpp/Makefile.common
include ../../devel/omniORB/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
