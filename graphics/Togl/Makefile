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
DISTNAME=	Togl-1.7

CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=togl/}

MAINTAINER=	matthieu.herrb@laas.fr
HOMEPAGE=	http://togl.sourceforge.net/
COMMENT=	a Tk OpenGL widget

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--exec-prefix=${PREFIX}

include ../../pkgtools/libtool/depend.mk
include ../../mk/sysdep/tk.mk
include ../../mk/robotpkg.mk
