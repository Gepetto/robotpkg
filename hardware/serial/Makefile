# robotpkg Makefile for:	hardware/serial
# Created:			Anthony Mallet on Tue, 17 Jun 2008
#

DISTNAME=		serial-${VERSION}
VERSION=		1.1
CATEGORIES=		hardware
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/serial
LICENSE=		2-clause-bsd

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Driver and interface for serial ports

GNU_CONFIGURE=		yes

include ../../devel/mkdep/depend.mk
include ../../middleware/pocolibs/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/autoconf.mk
include ../../mk/sysdep/automake.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

pre-configure: autogen

.PHONY: autogen
autogen:
	${RUN} cd ${WRKSRC} &&
	  ${SH} -ec '${LIBTOOLIZE} -c -i -f; ${ACLOCAL} -I m4; ${AUTOCONF}'
