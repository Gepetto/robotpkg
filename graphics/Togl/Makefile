# Copyright (c) 2008-2010 LAAS/CNRS
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
PKGNAME=	Togl-${PKGVERSION}
DISTNAME=	Togl${PKGVERSION}-src
PKGVERSION=	2.0

CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=togl/}

MAINTAINER=	matthieu.herrb@laas.fr
HOMEPAGE=	http://togl.sourceforge.net/
COMMENT=	a Tk OpenGL widget

WRKSRC=		${WRKDIR}/${DISTNAME:-src=}

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--exec-prefix=${PREFIX}
CONFIGURE_ARGS+=	--with-tcl=$(dir ${TCL_CONFIG_SH})
CONFIGURE_ARGS+=	--with-tk=$(dir ${TK_CONFIG_SH})

include ../../pkgtools/libtool/depend.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/tk.mk
include ../../mk/robotpkg.mk
