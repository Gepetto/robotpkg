# robotpkg Makefile for:	pkgtools/pkgin
# Created:			Anthony Mallet on Mon, 5 Aug 2013
#

PKGREVISION=		2
DISTNAME=		pkgin-0.6.4
CATEGORIES=		pkgtools
MASTER_SITES=		ftp://ftp.NetBSD.org/pub/NetBSD/misc/imil/

MAINTAINER=		mallet@laas.fr
HOMEPAGE=		http://pkgin.net/
COMMENT=		Apt / yum like tool for managing pkgsrc binary packages
LICENSE=		modified-bsd

CONF_DIR=		${PKG_SYSCONFDIR}/robot${PKGBASE}
INSTALLATION_DIRS+=	bin ${PKGMANDIR}/man1 ${CONF_DIR}

WRKSRC=			${WRKDIR}/pkgin-3859170568fbe4fe21b5660dbaeca8d65ac10f1b

SUBST_CLASSES+=		path
SUBST_STAGE.path=	pre-configure
SUBST_MESSAGE.path=	Adjusting paths
SUBST_FILES.path=	pkgin.1
SUBST_SED.path=		-e "s|/usr/pkg/etc|${PKG_SYSCONFDIR}|g"
SUBST_SED.path+=	-e "s|pkgin|robotpkgin|g" -e "s|PKGIN|ROBOTPKGIN|g"
SUBST_SED.path+=	-e "s|pkg_|robotpkg_|g"

GNU_CONFIGURE=		yes
MAKE_ENV+=		UNAME=$(or ${UNAME},uname)
MAKE_ENV+=		PKGTOOLS=${PREFIX}/sbin
MAKE_ENV+=		VARBASE=${PREFIX}/var

LIBARCHIVE_STYLE=	inplace
LIBFETCH_STYLE=		inplace
LIBNBCOMPAT_STYLE=	inplace

include ../../pkgtools/install-sh/depend.mk
include ../../pkgtools/libnbcompat/depend.mk
include ../../archivers/libarchive/depend.mk
include ../../net/libfetch/depend.mk
include ../../mk/language/c.mk
include ../../mk/sysdep/libsqlite3.mk
include ../../mk/sysdep/openssl.mk
include ../../mk/robotpkg.mk

# These files are included in pkgin source. However, our pkg_install is patched
# to handle ~options suffix, so get the locally patched source instead of the
# bundled versions.
PKG_INSTALL_SRC=	opattern.c dewey.c xwrapper.c

post-extract:
	${RUN}for f in ${PKG_INSTALL_SRC}; do				\
	  ${CP} ${ROBOTPKG_DIR}/pkgtools/pkg_install/dist/lib/$$f	\
	   ${WRKSRC}/external/.;					\
	done

do-install:
	${RUN}								\
	${INSTALL_PROGRAM} ${WRKSRC}/pkgin				\
		${DESTDIR}${PREFIX}/bin/robotpkgin;			\
	${INSTALL_MAN} ${WRKSRC}/pkgin.1				\
		${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/robotpkgin.1;	\
	${INSTALL_DATA} ${WRKSRC}/repositories.conf			\
		${DESTDIR}${CONF_DIR}/
