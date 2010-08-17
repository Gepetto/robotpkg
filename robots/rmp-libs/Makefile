# robotpkg Makefile for:	robots/rmp-libs
# Created:			Matthieu Herrb on Mon, 23 Feb 2009
#
DISTNAME=	rmp-libs-0.4
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
