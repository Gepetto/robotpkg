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
#                                            Anthony Mallet on Wed Jul 28 2010
#
DISTNAME=		mwalk-genom-1.0

CATEGORIES=		motion
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=mwalk-genom/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/mwalk-genom

MAINTAINER=		mallet@laas.fr
COMMENT=		Walking pattern generator for HRP-2 - GenoM component
LICENSE=		2-clause-bsd

USE_LANGUAGES+=		c c++

GENOM_MODULE=		mwalk
CONFIGURE_ARGS+=	--with-openhrp=${PREFIX.OpenHRP}

define PKG_OPTION_UNSET.api
  include ../../architecture/openhrp/depend.mk
  include ../../robots/hrpsys-jrl/depend.mk
  include ../../motion/libmwalk/depend.mk
endef

include ../../robots/hrp2-genom/depend.mk
include ../../architecture/genom/depend.mk
include ../../mk/robotpkg.mk
