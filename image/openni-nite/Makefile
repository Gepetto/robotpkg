# robotpkg Makefile for:	hardware/openni-nite
# Created:			Matthieu Herrb on Tue, 14 Dec 2010
#

PKGREVISION=	3
DISTNAME=	openni-nite-${PKG_VERSION}
PKG_VERSION=	1.5.2.21
MASTER_SITES=	${HOMEPAGE}/wp-content/uploads/2012/12/
CATEGORIES=	image
DISTFILES=	NITE-Bin-Linux-x64-v${PKG_VERSION}.tar.zip
DISTFILES+=	NITE-Bin-Linux-x86-v${PKG_VERSION}.tar.zip

COMMENT=	Primesense OpenNI nite binary blob
HOMEPAGE=	http://www.openni.org
LICENSE=	primesense-license
RESTRICTED=	Redistribution of source and binaries not permitted
NO_PUBLIC_SRC=	${RESTRICTED}
NO_PUBLIC_BIN=	${RESTRICTED}

include ../../mk/robotpkg.prefs.mk

ONLY_FOR_PLATFORM=	Linux-%

ifeq (${MACHINE_ARCH},x86_64)
  NI_ARCH=x64
else ifeq (${MACHINE_ARCH},i386)
  NI_ARCH=x86
else
  PKG_FAIL_REASON+=	"Architecture not supported"
endif
FETCH_ONLY=	NITE-Bin-Linux-${NI_ARCH}-v${PKG_VERSION}.tar.zip
EXTRACT_ONLY=	${FETCH_ONLY}

WRKSRC= ${WRKDIR}/NITE-Bin-Dev-Linux-${NI_ARCH}-v${PKG_VERSION}

NO_CONFIGURE=	yes
NO_BUILD=	yes
INSTALLATION_DIRS = \
	${PREFIX}/etc/primesense \
	${PREFIX}/lib \
	${PREFIX}/include/nite \
	${PREFIX}/share/java

NIREG=		${PREFIX.openni}/bin/niReg
NILICENSE=	${PREFIX.openni}/bin/niLicense

# INSTALL/DEINSTALL script
INSTALL_VARS+=	ECHO SED SORT TEST NIREG NILICENSE
INSTALL_SRC+=	${WRKDIR}/register
DEINSTALL_SRC+=	${WRKDIR}/register

DEPEND_METHOD.pax+=	bootstrap
DEPEND_METHOD.bzip2+=	bootstrap
include ../../archivers/bzip2/depend.mk
include ../../middleware/openni/depend.mk
include ../../hardware/openni-sensor/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../mk/sysdep/bash.mk
include ../../mk/sysdep/wget.mk

DEPEND_ABI.openni+=		~sse3
DEPEND_ABI.openni-sensor+=	~sse3

include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

# This is a zipped .tar.bz2. Yay.
do-extract:
	${RUN}cd ${WRKDIR} &&				\
	${EXTRACT_LOGFILTER} ${SH} -c "			\
	  ${UNZIP_CMD} -ao ${DISTDIR}/${EXTRACT_ONLY} &&\
	  ${BZIP2_CMD} -cd ${EXTRACT_ONLY:.zip=.bz2} |	\
	  ${PAX} -v -r					\
	"

do-install:
	${RUN}cd ${WRKSRC} &&						\
	${INSTALL_LOGFILTER} ${SH} -exc '				\
	  ${CP} Bin/libXnVNite*.so ${DESTDIR}${PREFIX}/lib/;		\
	  ${CP} Bin/libXnVCNITE*.so ${DESTDIR}${PREFIX}/lib/;		\
	  ${CP} Bin/libXnVNITE.jni*.so ${DESTDIR}${PREFIX}/lib/;	\
	  ${CP} Features_1_5_2/Bin/XnVSceneServer_1_5_2			\
	    ${DESTDIR}${PREFIX}/bin/;					\
	  ${CHMOD} a+x ${DESTDIR}${PREFIX}/bin/XnVSceneServer_1_5_2;	\
	  ${CP} Include/* ${DESTDIR}${PREFIX}/include/nite/;		\
	  ${CP} Bin/com.primesense.NITE.jar				\
	    ${DESTDIR}${PREFIX}/share/java/;				\
	  for f in Features_* Hands_*; do				\
	    ${MKDIR} ${DESTDIR}${PREFIX}/etc/primesense/$$f;		\
            ${CP} -r $$f/Data/* ${DESTDIR}${PREFIX}/etc/primesense/$$f;	\
	    for l in $$f/Bin/lib*.so; do				\
	      ${CP} $$l ${DESTDIR}${PREFIX}/lib/;			\
	    done;							\
	  done								\
	'

.PHONY: ${WRKDIR}/register
${WRKDIR}/register: ${ROBOTPKG_DIR}/middleware/openni/files/register
	${RUN} cd ${WRKSRC}; exec >$@;					\
	${CAT} $^;							\
	for f in Features_* Hands_*; do					\
	  for l in $$f/Bin/lib*.so; do					\
	    ${ECHO} '# NIREG:' lib/$${l##*/} etc/primesense/$$f;	\
	  done;								\
	done;								\
	${ECHO} '# NILIC: PrimeSense 0KOIk2JeIBYClPWVnMoRKn5cdY4='
