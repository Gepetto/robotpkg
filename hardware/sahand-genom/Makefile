#
# Copyright (c) 2009 CNRS/LAAS
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

DISTNAME=	sahand-genom-0.2
CATEGORIES=	hardware
COMMENT=	Schunk Antropomorphic Hand control module - Genom componenent
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=sahand-genom/}
MASTER_REPOSITORY=      ${MASTER_REPOSITORY_OPENROBOTS}sahand-genom

MAINTAINER=     openrobots@laas.fr

GNU_CONFIGURE=	yes
USE_LANGUAGES=	c c++

GENOM_MODULE=	sahand

include ../../hardware/sahand-libs/depend.mk
include ../../devel/mkdep/depend.mk
include ../../architecture/genom/depend.mk
include ../../mk/robotpkg.mk
