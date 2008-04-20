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
FORCE_PKG_REGISTER=	yes

include ../../mk/robotpkg.prefs.mk

# We use the newly built robotpkg_{add,create,delete} since upgrading
# from an older pkg_install might required features of the new program. 
# robotpkg_info is used at several places in mk files, so we don't
# override the default here.
#
PKG_ADD_CMD=            ${WRKSRC}/add/robotpkg_add
PKG_CREATE_CMD=         ${WRKSRC}/create/robotpkg_create
PKG_DELETE_CMD=         ${WRKSRC}/delete/robotpkg_delete

CPPFLAGS+=		-DDEF_UMASK=${DEF_UMASK}

PLIST_SUBST+=		PKG_DBDIR=${PKG_DBDIR}

DEINSTALL_SRC=		# empty
INSTALL_SRC=		${PKGDIR}/INSTALL
FILES_SUBST+=		PKG_DBDIR=${PKG_DBDIR}			\
			PKG_TOOLS_BIN=${PKG_TOOLS_BIN}		\
			MKDIR=${MKDIR}

VERSION=		$(shell	${AWK} -F '"' '/PKGTOOLS_VERSION/ {print $$2}' \
				${CURDIR}/dist/lib/version.h)

# for now still require these explicitely
include ../../pkgtools/pax/depend.mk
include ../../pkgtools/tnftp/depend.mk

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

# Remove any old pkg_install versions from database
pre-install: pkg_install-remove-old

.PHONY:
pkg_install-remove-old:
	${RUN}								\
	{ ${PKG_INFO} -e '${PKGWILDCARD}' || ${TRUE}; } | 		\
	while read pkg; do						\
		${ECHO} "Running ${PKG_DELETE} -N -f $$pkg"; 		\
		${PKG_DELETE} -N -f "$$pkg" || ${TRUE} ; 		\
	done
