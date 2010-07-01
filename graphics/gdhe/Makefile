# $LAAS: Makefile 2009/04/08 17:23:18 mallet $
#
# Copyright (c) 2008-2009 LAAS/CNRS
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

DISTNAME=	gdhe-3.8.1

CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=gdhe/}

MAINTAINER=	matthieu@laas.fr
HOMEPAGE=	https://softs.laas.fr/openrobots/wiki/gdhe
COMMENT=	3D Visualization tools

LICENSE=	2-clause-bsd

USE_LANGUAGES+= c c++

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-tcl=$(dir ${TCL_CONFIG_SH})
CONFIGURE_ARGS+=--with-tk=$(dir ${TK_CONFIG_SH})

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../devel/mkdep/depend.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/sysdep/glu.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/tk.mk
include ../../mk/robotpkg.mk
