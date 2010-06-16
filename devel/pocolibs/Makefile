#
# Copyright (c) 2007-2010 LAAS/CNRS
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
#                                       Anthony Mallet on Sun Jan 28 2007
#

DISTNAME=		pocolibs-2.7.1
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=pocolibs/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/pocolibs

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		https://softs.laas.fr/openrobots/wiki/pocolibs
COMMENT=		Real-time communication library used by GenoM modules.

NOT_FOR_PLATFORM=	# empty
GNU_CONFIGURE=		yes

# Enable valgrind support
PKG_SUPPORTED_OPTIONS+=	valgrind
PKG_OPTION_DESCR.valgrind:=	Enable valgrind support

define PKG_OPTION_SET.valgrind
  CONFIGURE_ARGS+=	--enable-valgrind
  include ../../mk/sysdep/valgrind.mk
endef

include ../../devel/mkdep/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
