# robotpkg Makefile for:	devel/boost-jam
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

# Borrowed from NetBSD pkgsrc,
# $NetBSD: Makefile,v 1.3 2008/01/04 19:58:40 jmmv Exp $

BOOST_PACKAGE=		jam
BOOST_COMMENT=		(Boost.Jam utility)

PREFER.boost?=		robotpkg
include ../../meta-pkgs/boost/Makefile.common

SUBST_CLASSES+=		bb
SUBST_MESSAGE.bb=	Fixing path to Boost.Build files.
SUBST_STAGE.bb=		pre-build
SUBST_FILES.bb=		tools/build/v2/engine/Jambase
SUBST_SED.bb=\
  -e 's,/usr/share/boost-build,${PREFIX}/share/boost-build,g'

INSTALLATION_DIRS=	bin

include ../../devel/boost-build/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

do-build:
	${RUN}cd ${WRKSRC}/tools/build/v2/engine && ${BUILD_LOGFILTER}	\
	  ${SETENV} ${MAKE_ENV} ${SH} ./build.sh ${BOOST_TOOLSET}

do-install:
	${RUN}${INSTALL_PROGRAM} \
	  ${WRKSRC}/tools/build/v2/engine/bin.*/bjam ${PREFIX}/bin
