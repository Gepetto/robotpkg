#
# Copyright (c) 2007-2009 LAAS/CNRS
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
#                                             Anthony Mallet on Wed Oct 17 2007
#

DISTNAME=		openprs-1.0b4
CATEGORIES=		architecture
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=openprs/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		https://softs.laas.fr/openrobots/wiki/openprs
COMMENT=		Open Source Procedural Reasoning System

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-readline=${PREFIX.readline}
CONFIGURE_ARGS+=	--with-motif-includes=${PREFIX.motif}/include
CONFIGURE_ARGS+=	--with-motif-libraries=${PREFIX.motif}/lib

include ../../devel/mkdep/depend.mk
include ../../mk/sysdep/motif.mk
include ../../mk/sysdep/readline.mk
include ../../mk/robotpkg.mk
