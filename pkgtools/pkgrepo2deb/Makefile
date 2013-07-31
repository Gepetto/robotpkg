# robotpkg Makefile for:	pkgtools/pkgrepo2deb
# Created:			Anthony Mallet on Fri, 12 Jul 2013
#

DISTNAME=		pkgrepo2deb-0.9.20130718
CATEGORIES=		pkgtools
MASTER_SITES=		# empty, but ${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	git git://git.openrobots.org/robots/${PKGBASE}
DISTFILES=		# empty

COMMENT=		Convert robotpkg binary packages to debian packages
LICENSE=		2-clause-bsd
MAINTAINER=		mallet@laas.fr

NO_CHECKSUM=		yes
NO_BUILD=		yes
NOT_FOR_PLATFORM=	# empty
WRKSRC=			${WRKDIR}/${PKGBASE}

GPG_DEF=		${PREFIX.gnupg}/bin/gpg --homedir=${GPG_DEFHOMEDIR}
GPG_DEFHOMEDIR=		${PKG_SYSCONFDIR}/gnupg
INSTALLATION_DIRS+=	${GPG_DEFHOMEDIR}

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	SED=${SED}
CONFIGURE_ARGS+=	PAX=${PAX}
CONFIGURE_ARGS+=	GZIP_CMD=${GZIP_CMD}
CONFIGURE_ARGS+=	GPG=$(call quote,${GPG_DEF})
CONFIGURE_ARGS+=	ROBOTPKG_ADMIN=${LOCALBASE}/sbin/robotpkg_admin
CONFIGURE_ARGS+=	DPKG_DEB=${PREFIX.dpkg}/bin/dpkg-deb
CONFIGURE_ARGS+=	APT_FTPARCHIVE=${PREFIX.apt}/bin/apt-ftparchive

MESSAGE_SUBST+=		GPG_CMD=${PREFIX.gnupg}/bin/gpg
MESSAGE_SUBST+=		GPG_HOMEDIR=${GPG_DEFHOMEDIR}

# XXX missing runtime dependency on pkg_install - this cannot be added easly
# because of bulk using pkg_install as a system package.

include ../../pkgtools/pax/depend.mk
include ../../mk/sysdep/apt.mk
include ../../mk/sysdep/dpkg.mk
include ../../mk/sysdep/gnupg.mk
include ../../mk/sysdep/gzip.mk
include ../../mk/robotpkg.mk

do-extract:
	@${CP} -Rp ${CURDIR}/dist ${WRKSRC}

post-install: gpg-set-perm

.PHONY: gpg-set-perm
gpg-set-perm:
	${RUN} ${CHMOD} 700 ${GPG_DEFHOMEDIR}