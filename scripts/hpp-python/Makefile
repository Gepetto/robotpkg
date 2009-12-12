# $LAAS: Makefile 2008/05/25 15:48:02 tho $
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
#                                     Florent Lamiraux on Wed Oct 10 2007
#

DISTNAME=	hpppython-${VERSION}
PKGNAME=	hpppython-${VERSION}
VERSION=	1.1

CATEGORIES=	scripts
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=
COMMENT=	Python scripts creating CORBA client of hppCorbaServer

GNU_CONFIGURE=	yes

include ../../devel/hpp-corbaserver/depend.mk
include ../../devel/omniORBpy/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
