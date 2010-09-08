# $LAAS: Makefile 2010/07/13 11:55:00 tmoulard $
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
#                                           Thomas Moulard on Tue Jul 13 2010
#

DISTNAME=		openvrml-0.18.6

CATEGORIES=		devel
#MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=openvrml/openvrml/0.18.6/}
MASTER_SITES=		http://downloads.sourceforge.net/project/openvrml/openvrml/0.18.6/


MAINTAINER=		openvrml-develop@lists.sourceforge.net
HOMEPAGE=		http://www.openvrml.org
COMMENT=		A free VRML/X3D runtime.

USE_LANGUAGES+=		c c++

GNU_CONFIGURE=	yes

# FIXME: For now, get rid of exotic/not so useful dependencies.
CONFIGURE_ARGS+=--disable-script-node-javascript
CONFIGURE_ARGS+=--disable-script-node-java
CONFIGURE_ARGS+=--disable-xembed
CONFIGURE_ARGS+=--disable-player
CONFIGURE_ARGS+=--disable-mozilla-plugin
CONFIGURE_ARGS+=--disable-examples

include ../../mk/robotpkg.mk
