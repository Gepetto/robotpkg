#
# Copyright (c) 2008 CNRS/LAAS
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
DISTNAME=	rmp-libs-0.2
PKGREVISION=	1
CATEGORIES=	robots

MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=rmp400/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/rmp-libs
MAINTAINER=	openrobots@laas.fr
COMMENT=	interface library for the Segway RMP400 platform

GNU_CONFIGURE=	yes

pre-configure:	autoreconf

include ../../hardware/libftdi/depend.mk
include ../../devel/pocolibs/depend.mk
include ../../devel/mkdep/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/autoconf.mk
include ../../mk/robotpkg.mk
