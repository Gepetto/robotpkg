#
# Copyright (c) 2010 LAAS/CNRS
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
#                                            Xavier BROQUERE on Fri Feb 26 2010
#
DISTNAME=		softMotion-libs-${PKGVERSION}
PKGVERSION=		1.0

CATEGORIES=		motion
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=softMotion-libs/}
MASTER_REPOSITORY=      git ssh://trac.laas.fr/git/robots/softMotion-libs

MAINTAINER=		openrobots@laas.fr

COMMENT=		SoftMotion Planner Library

USE_LANGUAGES+=		c c++

include ../../mk/sysdep/swig.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
