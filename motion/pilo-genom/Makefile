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

DISTNAME=	pilo-genom-1.0
CATEGORIES=	motion
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=pilo/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/pilo-genom

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://softs.laas.fr/openrobots/
COMMENT=	Planar trajectory execution module - Genom component

GNU_CONFIGURE=	yes

PKG_OPTIONS_REQUIRED_GROUPS=	robot
PKG_OPTIONS_GROUP.robot=	 atrv b21r fake h2 jido locoDemo xr4000

PKG_OPTION_DESCR.atrv=	Enable support for the atrv platform
define PKG_OPTION_SET.atrv
  GENOM_ARGS+= -DATRV
  include ../../robots/rflex-genom/depend.mk
endef

PKG_OPTION_DESCR.b21r=	Enable support for the b21r platform
define PKG_OPTION_SET.b21r
  GENOM_ARGS+= -DB21R
  include ../../robots/rflex-genom/depend.mk
endef

PKG_OPTION_DESCR.fake=	Enable support for a fake platform
PKG_OPTION_SET.fake:=	GENOM_ARGS+= -DFAKE

PKG_OPTION_DESCR.h2=	Enable support for the Hilare 2 platform
PKG_OPTION_SET.h2:=	GENOM_ARGS+= -DH2

PKG_OPTION_DESCR.jido=	Enable support for the jido platform
define PKG_OPTION_SET.jido	
  GENOM_ARGS+= -DJIDO
  include ../../robots/jloco-genom/depend.mk
endef

PKG_OPTION_DESCR.locoDemo=	Enable support for the locoDemo simulator
define PKG_OPTION_SET.locoDemo
  GENOM_ARGS+= -DLOCODEMO
  include ../../motion/locoDemo-genom/depend.mk
endef

PKG_OPTION_DESCR.xr4000=	Enable support for the xr4000 platform
PKG_OPTION_SET.xr4000:=		GENOM_ARGS+= -XR4000

GENOM_MODULE=	pilo
include ../../architecture/genom/depend.mk

include ../../architecture/genPos-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mk/robotpkg.mk
