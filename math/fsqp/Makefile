# robotpkg Makefile for:	math/fsqp
# Created:			florent on Wed, 14 Oct 2009
#

DISTNAME=	fsqp-${PKGVERSION_NOREV}
PKGVERSION=	2.5d

CATEGORIES=	math
MASTER_SITES=	# non-free

MAINTAINER=	hpp@laas.fr
HOMEPAGE=	http://www.aemdesign.com/FSQPwhatis.htm
COMMENT=	Feasible Sequential Quadratic Programming
LICENSE=	aemdesign-cfsqp-license

RESTRICTED=	Redistribution not permitted
NO_PUBLIC_SRC=	${RESTRICTED}
NO_PUBLIC_BIN=	${RESTRICTED}


INTERACTIVE_STAGE=	fetch
GNU_CONFIGURE=		yes
DOXYGEN_PLIST_DIR+=	share/doc/fsqp

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/unzip.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

post-extract:
	${CHMOD} +x ${WRKSRC}/install-sh
