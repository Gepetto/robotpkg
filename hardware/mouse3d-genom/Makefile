# $LAAS: Makefile 2008/05/25 15:18:47 tho $
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
#                                      Xavier Broquere
#

DISTNAME=		mouse3d-genom-1.0
CATEGORIES=		hardware	
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		

GNU_CONFIGURE=		yes

GENOM_MODULE=		mouse3d
include ../../architecture/genom/depend.mk

include ../../hardware/spnav-kmod/depend.mk
include ../../hardware/spnav-libs/depend.mk
include ../../mk/robotpkg.mk
