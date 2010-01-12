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

DISTNAME=	locoDemo-genom-1.2
PKGREVISION=	1
CATEGORIES=	motion
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=locoDemo-genom/}

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://softs.laas.fr/openrobots/
COMMENT=	Demo/simulation locomotion module - Genom component

GNU_CONFIGURE=	yes

GENOM_MODULE=	locoDemo

include ../../architecture/genom/depend.mk

include ../../localization/pom-genom/depend.mk
include ../../architecture/genPos-genom/depend.mk
include ../../mk/robotpkg.mk
