# $LAAS: Makefile 2009/04/06 14:19:25 mallet $
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
#                                             Anthony Mallet on Mon May 14 2007
#

DISTNAME=	abstractrobotdynamics-${VERSION}
PKGNAME=	jrl-interface-dynamics-${VERSION}
VERSION=	1.15.0

CATEGORIES=	interfaces
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=jrl-interface-dynamics/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}abstractRobotDynamics

DOXYGEN_PLIST_DIR+=	share/doc/abstractRobotDynamics

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	JRL abstract interface for dynamic robot model.

USE_LANGUAGES+=	c c++

include ../../interfaces/jrl-mal/depend.mk

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
