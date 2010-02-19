#
# Copyright (c) 2009-2010 LAAS/CNRS
# All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without   fee is hereby granted, provided   that the above  copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
#
#                                             Daniel Sidobre on Mon Mar  9 2009
#

DISTNAME=	gbM-0.4
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=gbM/}
MASTER_REPOSITORY= git ssh://trac.laas.fr/git/robots/gbM

MAINTAINER=	daniel.sidobre@laas.fr
#HOMEPAGE=	softs.laas.fr:/ftp/pub/openrobots/
COMMENT=	geometry for 6R arms

CONFIGURE_ARGS+=--with-tcl=$(dir ${TCL_CONFIG_SH})
CONFIGURE_ARGS+=--with-tk=$(dir ${TK_CONFIG_SH})

pre-configure: autoreconf

include ../../devel/mkdep/depend.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/tk.mk
include ../../mk/sysdep/swig.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/sysdep/autoconf.mk
include ../../mk/robotpkg.mk
