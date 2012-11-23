# robotpkg Makefile for:	devel/boost-build
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

# Borrowed from NetBSD pkgsrc,
# $NetBSD: Makefile,v 1.10 2008/05/26 02:13:17 joerg Exp $

BOOST_PACKAGE=		build
BOOST_COMMENT=		(Boost.Build framework)

EGDIR=			share/examples/boost-build
INSTALLATION_DIRS+=	share/boost-build
INSTALLATION_DIRS+=	${EGDIR}

include ../../devel/boost/Makefile.common

SUBST_CLASSES+=		confdir
SUBST_MESSAGE.confdir=	Fixing path to site-config.jam.
SUBST_STAGE.confdir=	pre-build
SUBST_FILES.confdir=	tools/build/v2/build-system.jam
SUBST_SED.confdir=	-e 's,/etc,${PKG_SYSCONFDIR},g'

do-build:
	${RUN}exec >${WRKDIR}/site-config.jam;				\
	${ECHO} '# System wide configuration file for Boost.Build.';	\
	${ECHO};							\
	${ECHO} 'using ${BOOST_TOOLSET}::"${CXX}" ;'

do-install:
	${RUN}cd ${WRKSRC}/tools/build/v2 && ${INSTALL_LOGFILTER}	\
	${PAX} -rw -pp -pm -s ':^./engine.*$$::' -s ':^.*\.orig$$::'	\
	  . ${PREFIX}/share/boost-build
	${RUN}${INSTALL_DATA} ${WRKDIR}/site-config.jam			\
	  ${PREFIX}/${EGDIR}/.

include ../../pkgtools/pax/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/robotpkg.mk
