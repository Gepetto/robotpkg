# $LAAS: Makefile 2008/05/25 12:13:06 tho $
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
#                                       Anthony Mallet on Tue Nov 13 2007
#

DISTNAME=		genom-openhrp-plugin-1.1
CATEGORIES=		architecture
MASTER_SITES=		${MASTER_SITE_JRL}

MAINTAINER=		gepetto@laas.fr
#HOMEPAGE=
COMMENT=		Interface plugin between GenoM and OpenHRP

GNU_CONFIGURE=		yes

CONFIGURE_ARGS+=	--with-idl=omniorb
CONFIGURE_ARGS+=	--with-openhrp=${PREFIX.openhrp-jrl}/OpenHRP

include ../../architecture/openhrp-jrl/depend.mk
include ../../devel/omniORB/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
