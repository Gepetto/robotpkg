# $LAAS: Makefile 2008/05/25 13:26:00 tho $
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
#                                      Arnaud Degroote on Sat May 17 2008
#

DISTNAME=	gdhe-3.8

CATEGORIES=	graphics
MASTER_SITES=	http://softs.laas.fr/openrobots/php/download.php/

MAINTAINER=	matthieu@laas.fr
HOMEPAGE=	https://softs.laas.fr/openrobots/wiki/gdhe
COMMENT=	3D Visualization tools

DEPENDS+=	mkdep>=2.7:../../devel/mkdep

GNU_CONFIGURE=	yes

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
