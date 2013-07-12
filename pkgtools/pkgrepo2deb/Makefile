# robotpkg Makefile for:	pkgtools/pkgrepo2deb
# Created:			Anthony Mallet on Fri, 12 Jul 2013
#

DISTNAME=		pkgrepo2deb-0.9.20130712
CATEGORIES=		pkgtools
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	git git://git.openrobots.org/robots/${PKGBASE}

COMMENT=		Convert robotpkg binary packages to debian packages
LICENSE=		2-clause-bsd
MAINTAINER=		mallet@laas.fr

NOT_FOR_PLATFORM=	# empty

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	SED=${SED}
CONFIGURE_ARGS+=	PAX=${PAX}
CONFIGURE_ARGS+=	GZIP_CMD=${GZIP_CMD}
CONFIGURE_ARGS+=	ROBOTPKG_ADMIN=${PKG_ADMIN_CMD}
CONFIGURE_ARGS+=	DPKG_DEB=${PREFIX.dpkg}/bin/dpkg-deb
CONFIGURE_ARGS+=	APT_FTPARCHIVE=${PREFIX.apt}/bin/apt-ftparchive

NO_BUILD=		yes

include ../../pkgtools/pax/depend.mk
include ../../mk/sysdep/apt.mk
include ../../mk/sysdep/dpkg.mk
include ../../mk/sysdep/gzip.mk
include ../../mk/robotpkg.mk
