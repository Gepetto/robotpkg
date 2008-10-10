# $LAAS: $
#
# Copyright (c) 2008 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
#                                      Anthony Mallet on Thu Oct  9 2008
#

# Borrowed from NetBSD pkgsrc,
# $NetBSD: Makefile,v 1.10 2008/05/26 02:13:17 joerg Exp $

BOOST_PACKAGE=		build
BOOST_COMMENT=		(Boost.Build framework)
BOOST_CONFIG=		no

include ../../devel/boost/Makefile.common

SUBST_CLASSES+=		confdir
SUBST_MESSAGE.confdir=	Fixing path to site-config.jam.
SUBST_STAGE.confdir=	pre-build
SUBST_FILES.confdir=	tools/build/v2/build-system.jam
SUBST_SED.confdir=	-e 's,/etc,${PKG_SYSCONFDIR},g'

EGDIR=                  ${PREFIX}/share/examples/boost-build

post-extract:
	${FIND} ${WRKSRC}/tools/build/v2 -type d -exec ${CHMOD} 755 {} \;
	${FIND} ${WRKSRC}/tools/build/v2 -type f -exec ${CHMOD} 644 {} \;

do-build:
	{ ${ECHO} '# System wide configuration file for Boost.Build.' ; \
	  ${ECHO} ; \
	  ${ECHO} 'using ${BOOST_TOOLSET} ;' ; } >${WRKDIR}/site-config.jam

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/boost-build
	cd ${WRKSRC}/tools/build/v2 && $(PAX) -rw -pp -pm		\
		-s ':^.*\.orig$$::' . ${PREFIX}/share/boost-build
	${INSTALL_DATA_DIR} ${EGDIR}
	${INSTALL_DATA} ${WRKDIR}/site-config.jam ${EGDIR}

include ../../mk/robotpkg.mk
