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

USE_LANGUAGES+= c c++

INTERACTIVE_STAGE=	fetch
FETCH_MESSAGE+=\
	"${bf}The file ${DISTNAME}${EXTRACT_SUFX} must be put manually into:${rm}"
FETCH_MESSAGE+= "       ${DISTDIR}/"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " To get the source code, contact ${MAINTAINER}."
FETCH_MESSAGE+= " Type \`${MAKE} show-license' for more information."

GNU_CONFIGURE=		yes
DOXYGEN_PLIST_DIR+=	share/doc/fsqp

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/unzip.mk
include ../../mk/robotpkg.mk

post-extract:
	${CHMOD} +x ${WRKSRC}/install-sh
