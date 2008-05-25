# $LAAS: Makefile 2008/05/25 14:22:03 tho $
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
#                                       Anthony Mallet on Tue Nov 20 2007
#

DISTNAME=		pom-genom-0.5
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for localization management.

GNU_CONFIGURE=		yes

DEPENDS+=		libpom>=1.1:../../localization/libpom

GENOM_MODULE=		pom
include ../../architecture/genom/depend.mk

include ../../localization/insitu/depend.mk
include ../../math/t3d/depend.mk
include ../../mk/robotpkg.mk
