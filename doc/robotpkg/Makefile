# $LAAS: Makefile 2009/01/13 11:56:45 tho $
#
# Copyright (c) 2009 LAAS/CNRS
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
#                                      Anthony Mallet on Sat Jan 10 2009
#

DISTNAME=               robotpkg-guide-${PKGVERSION}
CATEGORIES=             doc
MASTER_SITES=#		empty
DISTFILES=#		empty

MAINTAINER=             openrobots@laas.fr
HOMEPAGE=               http://www.laas.fr/~mallet/robotpkg
COMMENT=                A guide to robotpkg

include ../../mk/robotpkg.prefs.mk

PKGVERSION:=		$(shell ${DATE} '+%Y%m%d')
DIST_SUBDIR=            ${PKGBASE}
USE_LANGUAGES=#		empty

PLIST_SRC=              ${WRKDIR}/PLIST_DYNAMIC
DOCDIR=                 ${PREFIX}/share/doc/robotpkg

OUTPUTS?=               pdf
BUILD_TARGET=		${OUTPUTS}

include ../../mk/robotpkg.mk

# The source files are only symlinked into the WRKSRC, so that they can
# be easily modified, should the build phase fail.
pre-extract:
	${MKDIR} ${WRKSRC}
	${LN} -s ${FILESDIR}/* ${WRKSRC}
