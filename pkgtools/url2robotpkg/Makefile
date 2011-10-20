# robotpkg Makefile for:	pkgtools/url2pkg
# Created:			Anthony Mallet on Fri, 6 Mar 2009
#

DISTNAME=	url2robotpkg-2.7
CATEGORIES=	pkgtools
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	anthony.mallet@laas.fr
HOMEPAGE=	# empty
COMMENT=	Tool to automate initial steps in building a package
LICENSE=	public-domain

WRKSRC=		${WRKDIR}
NO_CHECKSUM=	yes
NO_BUILD=	yes
USE_LANGUAGES=	# none
INSTALLATION_DIRS=	bin man/man8

SUBST_CLASSES+=		up
SUBST_STAGE.up=		do-configure
SUBST_FILES.up=		url2robotpkg.pl
SUBST_SED.up=		-e 's,@MAKE@,${MAKE},g'
SUBST_SED.up+=		-e 's,@PERL@,${PERL},g'

include ../../mk/sysdep/perl.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/robotpkg.mk

do-extract:
	cd ${FILESDIR} && cp *.pl ${WRKSRC}/

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/url2robotpkg.pl ${PREFIX}/bin/url2robotpkg
	${INSTALL_MAN} ${FILESDIR}/url2robotpkg.8 ${PREFIX}/man/man8/url2robotpkg.8
