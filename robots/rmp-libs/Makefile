# robotpkg Makefile for:	robots/rmp-libs
# Created:			Matthieu Herrb on Mon, 23 Feb 2009
#
CATEGORIES=		robots
DISTNAME=		rmp-libs-0.4
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=rmp400/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/rmp-libs

COMMENT=		Interface library for the Segway RMP400 platform
MAINTAINER=		openrobots@laas.fr
LICENSE=		isc

ONLY_FOR_PLATFORM=	Linux-%
GNU_CONFIGURE=		yes

pre-configure:	m4dir autoreconf
m4dir:
	${RUN} ${MKDIR} ${WRKSRC}/m4

include ../../hardware/libftdi/depend.mk
include ../../middleware/pocolibs/depend.mk
include ../../devel/mkdep/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/autoconf.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
