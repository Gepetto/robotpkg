#
# Copyright (C) 2008 LAAS/CNRS
#
# Authored by Anthony Mallet on Fri Apr 18 2008
# From $NetBSD: Makefile,v 1.128 2006/07/18 23:06:41 jlam Exp $

DISTNAME=		pkg_install-${VERSION}
CATEGORIES=		pkgtools
MASTER_SITES=		# empty
DISTFILES=		# empty

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.pkgsrc.org/
COMMENT=		Package management and administration tools for robotpkg

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-pkgdbdir=${PKG_DBDIR}
CONFIGURE_ARGS+=	--with-ftp="\"${FETCH_CMD}\""
CONFIGURE_ARGS+=	--with-mtree="\"${MTREE}\""
CONFIGURE_ARGS+=	--with-pax="\"${PAX}\""
CONFIGURE_ARGS+=	--with-tar="\"${TAR}\""

NO_PKGTOOLS_REQD_CHECK=	yes
NO_CHECKSUM=		yes
PKG_PRESERVE=		yes

# We use the newly built pkg_delete since upgrading from an older
# pkg_install might require features of the new program.
#
PKG_DELETE=		${WRKSRC}/delete/robotpkg_delete

CPPFLAGS+=		-DDEF_UMASK=${DEF_UMASK}

PKG_DBDIR?=		/usr/openrobots/var/db/pkg
PKG_INFO=		${SETENV} PKG_DBDIR=${PKG_DBDIR} ${PKG_INFO_CMD}
PKG_ADMIN=		${SETENV} PKG_DBDIR=${PKG_DBDIR} ${PKG_ADMIN_CMD}

PLIST_SUBST+=		PKG_DBDIR=${PKG_DBDIR}

DEINSTALL_SRC=		# empty
INSTALL_SRC=		${PKGDIR}/INSTALL
FILES_SUBST+=		PKG_DBDIR=${PKG_DBDIR}			\
			PKG_TOOLS_BIN=${PKG_TOOLS_BIN}		\
			MKDIR=${MKDIR}

VERSION=		$(shell	${AWK} -F '"' '/PKGTOOLS_VERSION/ {print $$2}' \
				${CURDIR}/dist/lib/version.h)


# depend on these with the "inplace" style for bootstrap
LIBNBCOMPAT_CONFIGURE_ARGS+=	--enable-bsd-getopt
LIBNBCOMPAT_STYLE=	inplace
include ../../pkgtools/libnbcompat/depend.mk
ZLIB_STYLE=		inplace
include ../../archivers/zlib/depend.mk
BZIP2_STYLE=		inplace
include ../../archivers/bzip2/depend.mk
LIBARCHIVE_STYLE=	inplace
include ../../archivers/libarchive/depend.mk
LIBFETCH_STYLE=		inplace
include ../../net/libfetch/depend.mk

include ../../mk/robotpkg.mk

do-extract:
	${CP} -Rp ${CURDIR}/dist ${WRKSRC}

# Reverse the order that update does things since we need pkg_delete
# built before we can deinstall.
do-update:
	${MAKE} build
	${MAKE} deinstall _UPDATE_RUNNING=YES
	${MAKE} ${UPDATE_TARGET}
	${MAKE} clean
