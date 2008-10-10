# $LAAS: Makefile 2008/10/10 14:10:27 mallet $
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
#                                      Anthony Mallet on Fri Oct 10 2008
#

# Borrowed from NetBSD pkgsrc,
# $NetBSD: Makefile,v 1.6 2008/05/26 02:13:17 joerg Exp $

BOOST_PACKAGE=		docs
BOOST_COMMENT=		(documentation)
BOOST_CONFIG=		no

include ../../devel/boost/Makefile.common

DOCDIR=			${PREFIX}/share/doc/boost

NO_BUILD=		yes

include ../../mk/robotpkg.mk

do-install:
	${INSTALL_DATA_DIR} ${DOCDIR}
	cd ${WRKSRC} && pax -rw -pm \
		-s':^.*/build$$::' \
		-s':^.*/build/.*$$::' \
		-s':^libs/.*/test$$::' \
		-s':^libs/.*/test/.*$$::' \
		-s':^.*\.orig$$::' \
		*.png *.css *.htm libs more ${DOCDIR}
	${FIND} ${DOCDIR} \
		-type f -print | ${XARGS} ${CHOWN} ${SHAREOWN}:${SHAREGRP}
	${FIND} ${DOCDIR} \
		-type d -print | ${XARGS} ${CHMOD} ${PKGDIRMODE}
