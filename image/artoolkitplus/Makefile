# $LAAS: Makefile 2009/03/24 23:53:32 tho $
#
# Copyright (c) 2009 LAAS/CNRS
# All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without   fee is hereby granted, provided   that the above  copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
#
#                                             Anthony Mallet on Tue Mar 24 2009
#

PKGVERSION=	2.1.1
DISTNAME=	ARToolKitPlus_${PKGVERSION}
PKGNAME=	artoolkitplus-${PKGVERSION}
CATEGORIES=	image
MASTER_SITES=	http://studierstube.icg.tu-graz.ac.at/handheld_ar/download/
EXTRACT_SUFX=	.zip

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://studierstube.icg.tu-graz.ac.at/handheld_ar/artoolkitplus.php
COMMENT=	Physical markers localization in real time

USE_LANGUAGES=	c++
WRKSRC=		${WRKDIR}

CONFIGURE_DIRS=	. src tools tools/IdPatGen sample sample/multi sample/simple
CONFIGURE_ENV+=	ARTKP=${WRKSRC}
QMAKE_ARGS+=	PREFIX=${PREFIX}

BUILD_DIRS=	.
MAKE_ENV+=	ARTKP=${WRKSRC}

# depending on the platform, qmake doesn't produce the same libraries
GENERATE_PLIST=	cd ${PREFIX}; ${LS} -1 lib/libARToolKitPlus.*;

post-extract: fix-broken-headers

include ../../mk/sysdep/qmake.mk
include ../../mk/robotpkg.mk

# Fix some crazy ARToolKitPlus headers
#
# Basically, the following files are installed but do include other .cxx files
# with a relative path into the source directory. This is silly and obviously
# can't work. Fix by replacing the #include directives by the files contents.
BROKEN_HEADERS=\
	src/core/arLabeling.cxx					\
	include/ARToolKitPlus/TrackerImpl.h			\
	include/ARToolKitPlus/TrackerMultiMarkerImpl.h		\
	include/ARToolKitPlus/TrackerSingleMarkerImpl.h

.PHONY: fix-broken-headers
fix-broken-headers:
	@${STEP_MSG} "Fixing broken headers"
	${RUN}for h in ${BROKEN_HEADERS}; do (			\
	  f=$${h##*/}; d=$${h%$$f};				\
	  cd ${WRKSRC}; cd $$d;					\
	  ${MV} $$f $$f.orig;					\
	  ${AWK} <$$f.orig >$$f '				\
		/^#include "(\.\.\/|.*\.hxx)/ {			\
		  f = $$2; sub(/(\.\.\/)+/, "../../", f);	\
		  sub(/^[^"]*"/, "", f); sub(/"[^"]*$$/, "", f);\
		  print "// Included " f;			\
		  while ( (getline line < f) > 0 ) {		\
		    print line					\
		  }						\
		  print "// End of " f;				\
		  close(f);					\
		  next;						\
		}						\
								\
		{ print }';					\
	) done
