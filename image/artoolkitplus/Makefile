# robotpkg Makefile for:	image/artoolkitplus
# Created:			Anthony Mallet on Tue, 24 Mar 2009
#

VERSION=	2.1.1
PKGREVISION=	3
DISTNAME=	ARToolKitPlus_${VERSION}
PKGNAME=	artoolkitplus-${VERSION}
CATEGORIES=	image
MASTER_SITES=	http://studierstube.icg.tu-graz.ac.at/handheld_ar/download/
EXTRACT_SUFX=	.zip

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://studierstube.icg.tu-graz.ac.at/handheld_ar/artoolkitplus.php
COMMENT=	Physical markers localization in real time

LICENSE= gnu-gpl-v2

WRKSRC=		${WRKDIR}

MAKE_JOBS_SAFE=	no

CONFIGURE_DIRS=	. src tools tools/IdPatGen sample sample/multi sample/simple
CONFIGURE_ENV+=	ARTKP=${WRKSRC}
QMAKE_ARGS+=	PREFIX=${PREFIX}

BUILD_DIRS=	.
MAKE_ENV+=	ARTKP=${WRKSRC}

# depending on the platform, qmake doesn't produce the same libraries
GENERATE_PLIST=	cd ${PREFIX}; ${LS} -1 lib/libARToolKitPlus.*;

post-extract: fix-broken-headers

# NetBSD pkgsrc has a patched qmake that generates LIBTOOL-aware Makefile. The
# problem is that libtool must be passed --tag=CXX to accept the full compiler
# path as it is passed by robotpkg.
#
include ../../mk/robotpkg.prefs.mk # OPSYS
ifeq (NetBSD,${OPSYS})
  SUBST_CLASSES+=		libtool-fix
  SUBST_STAGE.libtool-fix=	post-configure
  SUBST_MESSAGE.libtool-fix=	Fixing libtool invocation
  SUBST_FILES.libtool-fix=	$(addsuffix /Makefile,. * */*)
  SUBST_SED.libtool-fix=\
	's|^LIBTOOL[ 	]*=.*$$|LIBTOOL=${LIBTOOL} --tag=CXX|g'
  include ../../pkgtools/libtool/depend.mk
endif

DEPEND_METHOD.unzip+=	bootstrap

include ../../mk/sysdep/qmake.mk
include ../../mk/sysdep/unzip.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

# A custom extract procedure is required to convert CR/LF in source files
# (mostly to get clean patches/* files) but extract pdf/png/jpg etc as binary.
# The archive does not have the zip 'b'inary vs. 't'ext flag right.
BINARY_FILES=	'*.pdf' '*.png' '*.gif' '*.jpg' '*.dat' '*.raw'
do-extract:
	${RUN}cd ${WRKDIR} && cd ${EXTRACT_DIR} &&			\
  $(foreach _,$(addprefix ${DISTDIR}/${DIST_SUBDIR}/,${DISTFILES}),	\
	${EXTRACT_LOGFILTER}						\
		${UNZIP_CMD} -aao "$_" -x ${BINARY_FILES} &&		\
	${EXTRACT_LOGFILTER}						\
		${UNZIP_CMD} -o "$_" ${BINARY_FILES} &&			\
  )									\
	: || exit 2


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
