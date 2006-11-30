# $NetBSD: Makefile,v 1.11 2006/07/14 22:13:19 jlam Exp $

DISTNAME=	pkgmanpages-20050911
CATEGORIES=	pkgtools
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	agc@NetBSD.org
HOMEPAGE=	http://www.pkgsrc.org/
COMMENT=	Manual page(s) for the robotic packages collection

NO_PKGTOOLS_REQD_CHECK=	# defined
PKG_PRESERVE=		# defined

NO_CHECKSUM=	yes
NO_MTREE=	yes
NO_CONFIGURE=	yes
NO_BUILD=	yes

INSTALLATION_DIRS=	${PKGMANDIR}/man7

include ../../mk/robotpkg.prefs.mk

do-extract:
	@${CP} -R ${FILESDIR} ${WRKSRC}

do-install:
	${INSTALL_MAN} ${WRKSRC}/packages.7 ${PREFIX}/${PKGMANDIR}/man7

include ../../mk/robotpkg.mk
