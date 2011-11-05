# robotpkg Makefile for:	pkgtools/install-sh
# Created:			Anthony Mallet on Sun, 29 Aug 2010
#
DISTNAME=	install-sh-20070712
CATEGORIES=	pkgtools
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	mallet@laas.fr
COMMENT=	install script compatible with the BSD install program
LICENSE=	mit

NO_CHECKSUM=		yes
NO_BUILD=		yes

SUBST_CLASSES+=		paths
SUBST_STAGE.paths=	pre-configure
SUBST_MESSAGE.paths=	Configuring default programs
SUBST_SED.paths=\
	$(foreach _,AWK MV CP CHMOD CHOWN RM,-e 's|@$_@|${$_}|')
SUBST_FILES.paths=	install-sh.in

include ../../mk/robotpkg.mk

# Use the install script to perform installation to avoid bootstrapping
# issues.
#
INSTALL_SCRIPT=\
	${SH} ${WRKSRC}/install-sh -c -o ${BINOWN} -g ${BINGRP} -m ${BINMODE}
INSTALL_SCRIPT_DIR=\
	${SH} ${WRKSRC}/install-sh -d -o ${BINOWN} -g ${BINGRP} -m ${BINMODE}

do-extract:
	@${CP} -R ${FILESDIR} ${WRKSRC}

do-configure:
	${RUN}${SED} -e "s|@DEFAULT_INSTALL_MODE@|"${PKGDIRMODE}"|g"	\
		${WRKSRC}/install-sh.in > ${WRKSRC}/install-sh

do-install:
	${RUN}${INSTALL_SCRIPT_DIR} ${DESTDIR}${PREFIX}/bin
	${RUN}${INSTALL_SCRIPT} ${WRKSRC}/install-sh ${DESTDIR}${PREFIX}/bin
