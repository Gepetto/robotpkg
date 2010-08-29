# robotpkg Makefile for:	devel/boost-docs
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

# Borrowed from NetBSD pkgsrc,
# $NetBSD: Makefile,v 1.6 2008/05/26 02:13:17 joerg Exp $

BOOST_PACKAGE=		docs
BOOST_COMMENT=		(documentation)
BOOST_CONFIG=		no

include ../../devel/boost/Makefile.common

DOCDIR=			${PREFIX}/share/doc/boost

NO_BUILD=		yes

include ../../pkgtools/install-sh/depend.mk
include ../../mk/robotpkg.mk

do-install:
	${RUN}${INSTALL_DATA_DIR} ${DOCDIR}
	${RUN}cd ${WRKSRC} && pax -rw -pm \
		-s':^.*/build$$::' \
		-s':^.*/build/.*$$::' \
		-s':^libs/.*/test$$::' \
		-s':^libs/.*/test/.*$$::' \
		-s':^.*\.orig$$::' \
		*.png *.css *.htm libs more ${DOCDIR}
	${RUN}${FIND} ${DOCDIR} \
		-type f -print | ${XARGS} ${CHOWN} ${SHAREOWN}:${SHAREGRP}
	${RUN}${FIND} ${DOCDIR} \
		-type d -print | ${XARGS} ${CHMOD} ${PKGDIRMODE}
