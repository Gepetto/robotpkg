# robotpkg Makefile for:	pkgtools/robotpkg_chk
# Created:			Anthony Mallet on Mon, 16 Mar 2009
#

DISTNAME=       robotpkg_chk-1.1
CATEGORIES=     pkgtools
MASTER_SITES=   # empty
DISTFILES=      # empty

MAINTAINER=	anthony.mallet@laas.fr
HOMEPAGE=       http://www.laas.fr/~mallet/robotpkg
COMMENT=        Check installed packages versions against robotpkg
LICENSE=	isc

WRKSRC=		${WRKDIR}
NO_CHECKSUM=    yes
NO_BUILD=       yes

USE_LANGUAGES=  # empty

SUBST_CLASSES+=         vars
SUBST_STAGE.vars=       pre-configure
SUBST_MESSAGE.vars=     Configuring sources
SUBST_FILES.vars=       robotpkg_chk.sh robotpkg_chk.8
SUBST_SED.vars=		$(foreach v,					\
	EXPR AWK GREP DATE GZIP_CMD ID MAKE ROBOTPKG_DIR		\
                        PKG_ADD PKG_ADMIN PKG_DELETE PKG_INFO		\
                        SED SH SORT TSORT PREFIX XARGS,			\
	-e 's|@$v@|${$v}|g')

do-extract:
	cp ${FILESDIR}/robotpkg_chk.sh ${WRKSRC}
	cp ${FILESDIR}/robotpkg_chk.8 ${WRKSRC}

do-install:
	${INSTALL_SCRIPT_DIR} ${PREFIX}/sbin
	${INSTALL_SCRIPT} ${WRKSRC}/robotpkg_chk.sh ${PREFIX}/sbin/robotpkg_chk
	${INSTALL_MAN_DIR} ${PREFIX}/man/man8
	${INSTALL_MAN} ${WRKSRC}/robotpkg_chk.8 ${PREFIX}/man/man8/robotpkg_chk.8

include ../../pkgtools/install-sh/depend.mk
include ../../mk/robotpkg.mk
