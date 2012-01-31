# robotpkg Makefile for:	math/roboptim-core-cfsqp-plugin
# Created:			Thomas Moulard on Tue, 17 Nov 2009
#

DISTNAME=	roboptim-core-cfsqp-plugin-0.4

CATEGORIES=	math
MASTER_SITES=	# non-free

MAINTAINER=	hpp@laas.fr
HOMEPAGE=	http://roboptim.sourceforge.net
COMMENT=	CFSQP solver back-end for roboptim-core
LICENSE=	aemdesign-cfsqp-license

USE_LANGUAGES+= c c++

RESTRICTED=	Redistribution not permitted
NO_PUBLIC_SRC=	${RESTRICTED}
NO_PUBLIC_BIN=	${RESTRICTED}

INTERACTIVE_STAGE=	fetch
FETCH_MESSAGE+=\
	"$${bf}The file ${DISTNAME}${EXTRACT_SUFX} must be put manually into:$${rm}"
FETCH_MESSAGE+= "       ${DISTDIR}/"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " To get the source code, contact ${MAINTAINER}."

GNU_CONFIGURE=		yes
DOXYGEN_PLIST_DIR+=	share/doc/roboptim-core-cfsqp-plugin

# Make sure git-version-gen is not confused by the robotpkg ``.git''
# directory.
BUILD_MAKE_FLAGS+=    GIT_DIR=/dev/null

include ../../optimization/roboptim-core/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/unzip.mk
include ../../mk/robotpkg.mk

post-install:
	${RUN} ${RM} ${PREFIX}/lib/roboptim-core-plugin-cfsqp.so
	$(LN) -s ${PREFIX}/lib/roboptim-core-cfsqp-plugin.so ${PREFIX}/lib/roboptim-core-plugin-cfsqp.so