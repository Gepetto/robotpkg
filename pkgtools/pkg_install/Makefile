# $NetBSD: Makefile,v 1.128 2006/07/18 23:06:41 jlam Exp $

# Notes to package maintainers:
#
# To update this package, import from src/usr.sbin/pkg_install.
#
# Updating this package does not automatically necessitate bumping
# PKGTOOLS_REQD in bsd.pkg.mk. Do so if and only if there is a critical
# change in the pkg_* tools that pkgsrc relies on for proper operation.

DISTNAME=		pkg_install-${VERSION}
CATEGORIES=		pkgtools
MASTER_SITES=		# empty
DISTFILES=		# empty

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://www.pkgsrc.org/
COMMENT=		Package management and administration tools for pkgsrc

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-pkgdbdir=${PKG_DBDIR}
CONFIGURE_ARGS+=	--with-ftp="\"${FETCH_CMD}"\"
CONFIGURE_ARGS+=	--with-mtree="\"${MTREE}"\"
CONFIGURE_ARGS+=	--with-pax="\"${PAX}"\"
CONFIGURE_ARGS+=	--with-tar="\"${TAR}"\"

SKIP_AUDIT_PACKAGES=	yes
NO_PKGTOOLS_REQD_CHECK=	yes
NO_CHECKSUM=		yes
NO_MTREE=		yes
PKG_PRESERVE=		yes

# We use the newly built pkg_delete since upgrading from an older
# pkg_install might required features of the new program.
#
PKG_DELETE=		${WRKSRC}/delete/pkg_delete

CPPFLAGS+=		-DDEF_UMASK=${DEF_UMASK}

PKG_DBDIR?=		/var/db/pkg
PKG_INFO=		${SETENV} PKG_DBDIR=${PKG_DBDIR} ${PKG_INFO_CMD}
PKG_ADMIN=		${SETENV} PKG_DBDIR=${PKG_DBDIR} ${PKG_ADMIN_CMD}

PLIST_SUBST+=		PKG_DBDIR=${PKG_DBDIR}

DEINSTALL_SRC=		# empty
INSTALL_SRC=		${PKGDIR}/INSTALL
FILES_SUBST+=		PKG_DBDIR=${PKG_DBDIR}			\
			PKG_TOOLS_BIN=${PKG_TOOLS_BIN}		\
			MKDIR=${MKDIR}

include ../../mk/robotpkg.mk

VERSION=	$(shell	${AWK} -F '"' '/PKGTOOLS_VERSION/ {print $$2}' \
			${FILESDIR}/lib/version.h)

do-extract:
	@${CP} -R ${FILESDIR} ${WRKSRC}

# XXX Reverse the order that update does things since
# XXX we need pkg_delete built before we can deinstall.
# XXX This should probably be the default order for all packages.
update:
	${MAKE} build
	${MAKE} deinstall _UPDATE_RUNNING=YES
	${MAKE} ${UPDATE_TARGET}
	${MAKE} clean

include ../../pkgtools/libnbcompat/inplace.mk
