# robotpkg Makefile for:	hardware/openni-nite
# Created:			Matthieu Herrb on Tue, 14 Dec 2010
#

PKGREVISION=	2
DISTNAME=	NITE-Bin-Linux-${NI_ARCH}-v${PKG_VERSION}
PKGNAME=	openni-nite-${PKG_VERSION}
PKG_VERSION=	1.5.2.21
MASTER_SITES=	${HOMEPAGE}/wp-content/uploads/2012/12/
CATEGORIES=	image
EXTRACT_SUFX=	.tar.zip

COMMENT=	Primesense OpenNI nite binary blob
HOMEPAGE=	http://www.openni.org
LICENSE=	primesense-license
RESTRICTED=	Redistribution of source and binaries not permitted
NO_PUBLIC_SRC=	${RESTRICTED}
NO_PUBLIC_BIN=	${RESTRICTED}

include ../../mk/robotpkg.prefs.mk
ifeq (${MACHINE_ARCH},x86_64)
  NI_ARCH=x64
else ifeq (${MACHINE_ARCH},i386)
  NI_ARCH=x86
else
  PKG_FAIL_REASON+=	"Architecture not supported"
endif

WRKSRC= ${WRKDIR}/NITE-Bin-Dev-Linux-${NI_ARCH}-v${PKG_VERSION}

NO_CONFIGURE=	yes
NO_BUILD=	yes
INSTALLATION_DIRS = \
	${PREFIX}/etc/primesense \
	${PREFIX}/lib \
	${PREFIX}/include/nite \
	${PREFIX}/share/java

# XXX the niReg process should be handled in INSTALL/DEINSTALL scripts
do-install:
	${RUN}cd ${WRKSRC} && \
		PREFIX=${PREFIX} ${BASH} ./install.sh 

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

include ../../mk/robotpkg.mk

# This is a zipped .tar.bz2. Yay.
do-extract:
	${RUN}cd ${WRKDIR} &&				\
	${EXTRACT_LOGFILTER} ${SH} -c "			\
	  ${UNZIP_CMD} -ao ${DISTDIR}/${DISTFILES} &&	\
	  ${BZIP2_CMD} -cd ${DISTFILES:.zip=.bz2} |	\
	  ${PAX} -v -r					\
	"
