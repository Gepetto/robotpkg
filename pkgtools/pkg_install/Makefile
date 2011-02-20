# robotpkg Makefile for:	pkgtools/pkg_install
# Created:			tho on Thu, 9 Nov 2006
#

VERSION=		20091115
PKGREVISION=		1
DISTNAME=		pkg_install-${VERSION}
CATEGORIES=		pkgtools
MASTER_SITES=		# empty
DISTFILES=		# empty

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.pkgsrc.org/
COMMENT=		Package management and administration tools for robotpkg
LICENSE=		2-clause-bsd

NOT_FOR_PLATFORM=	# empty

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=	--with-pkgdbdir=${PKG_DBDIR}

NO_PKGTOOLS_REQD_CHECK=	yes
NO_CHECKSUM=		yes
PKG_PRESERVE=		yes
FORCE_PKG_REGISTER=	yes

CPPFLAGS+=		-DDEF_UMASK=${DEF_UMASK}

PLIST_SUBST+=		PKG_DBDIR=${PKG_DBDIR}

DEINSTALL_SRC=		# empty
INSTALL_SRC=		${PKGDIR}/INSTALL

# depend on these with the "inplace" style for bootstrap
LIBNBCOMPAT_CONFIGURE_ARGS+=	--enable-bsd-getopt --enable-db
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

do-extract:
	${CP} -Rp ${CURDIR}/dist ${WRKSRC}

include ../../mk/robotpkg.mk

# We use the newly built robotpkg_{add,create,delete} when upgrading
# from an older pkg_install, because we might required features of the new
# program. robotpkg_info is used at several places in mk files, so we don't
# override the default here. Make sure to properly hook the package build
# before the new tools are needed.
#
PKG_ADD_CMD=	${WRKSRC}/add/robotpkg_add
PKG_CREATE_CMD=	${WRKSRC}/create/robotpkg_create
PKG_DELETE_CMD=	${WRKSRC}/delete/robotpkg_delete

pre-update:	pkg_build
pre-bulk:	pkg_build
pkg-deinstall:	pkg_build

.PHONY: pkg_build
pkg_build:
	${RUN}${RECURSIVE_MAKE} build

# Remove any old pkg_install versions from database
# To be on the safe side when upgrading, rebuild the pkgdb with new tools first
pre-install: pkg_rebuild_db pkg_install-remove-old

.PHONY: pkg_rebuild_db
pkg_rebuild_db:
ifneq (${PKGTOOLS_VERSION},${VERSION})
	${RUN}if [ -d ${PKG_DBDIR} ]; then				\
		${ECHO_MSG} "Rebuilding package database"; 		\
		${WRKSRC}/admin/robotpkg_admin -K ${PKG_DBDIR} rebuild;	\
	fi
else
	@:
endif

.PHONY: pkg_install-remove-old
pkg_install-remove-old:
	${RUN}								\
	{ ${PKG_INFO} -e '${PKGWILDCARD}' || ${TRUE}; } | 		\
	while read pkg; do						\
		${ECHO_MSG} "Removing old package"; 			\
		${PKG_DELETE} -N -f "$$pkg"||${TRUE};			\
	done
