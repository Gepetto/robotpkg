# robotpkg Makefile for:	math/meschach
# Created:			Anthony Mallet on Thu, 16 Dec 2010
#

DISTNAME=		mesch12b
PKGNAME=		meschach-1.2b
CATEGORIES=		math
MASTER_SITES=		http://www.math.uiowa.edu/~dstewart/meschach/

MAINTAINER=		mallet@laas.fr
HOMEPAGE=		http://www.math.uiowa.edu/~dstewart/meschach/
COMMENT=		Library of C Routines for Matrix Computations
LICENSE=		2-clause-bsd

WRKSRC=			${WRKDIR}
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-all
MAKE_FILE=		makefile

INSTALLATION_DIRS=	include/meschach lib share/meschach

post-patch:
	${CP} ${FILESDIR}/makefile.in ${WRKSRC}/
	${CP} ${WRKSRC}/MACHINES/GCC/machine.h ${WRKSRC}/

pre-configure: autoreconf

include ../../pkgtools/install-sh/depend.mk
include ../../mk/sysdep/autoconf.mk
include ../../mk/robotpkg.mk
