# robotpkg Makefile for:	graphics/sun-java3d
# Created:			Anthony Mallet on Fri, 5 Jan 2007
#

DISTNAME=	java3d-1_5_1-linux-${JAVA3D_ARCH}
PKGNAME=	sun-java3d-1.5.1
MASTER_SITES=	# empty
CATEGORIES=	devel
EXTRACT_SUFX=	.bin

COMMENT=	Sun Java 3D(TM) API
MAINTAINER=	openrobots@laas.fr
HOMEPAGE=\
	http://www.oracle.com/technetwork/java/javase/tech/index-jsp-138252.html
LICENSE=	oracle-java-license

RESTRICTED=     Redistribution of repackaged binaries not permitted
NO_SRC_ON_CDROM=${RESTRICTED}
NO_SRC_ON_FTP=  ${RESTRICTED}
NO_BIN_ON_CDROM=${RESTRICTED}
NO_BIN_ON_FTP=  ${RESTRICTED}

DOWNLOAD=\
	http://www.oracle.com/technetwork/java/javasebusiness/downloads/java-archive-downloads-java-client-419417.html#java3d-1.5.1-oth-JPR
INTERACTIVE_STAGE=	fetch
FETCH_MESSAGE+=		" The file ${DISTNAME}${EXTRACT_SUFX}"
FETCH_MESSAGE+=		""
FETCH_MESSAGE+=		" must be fetched into:"
FETCH_MESSAGE+=		"	${DISTDIR}"
FETCH_MESSAGE+=		" from:"
FETCH_MESSAGE+=		"	${DOWNLOAD}"
FETCH_MESSAGE+=		"	or ${ARCHIVE}"

include ../../mk/robotpkg.prefs.mk
ifeq (${MACHINE_ARCH},x86_64)
  JAVA3D_ARCH=amd64
else ifeq (${MACHINE_ARCH},i386)
  JAVA3D_ARCH=i586
else
  PKG_FAIL_REASON+=	"Architecture not supported"
endif

JAVA_PREFIX=		${PREFIX}/java
PLIST_SRC=		PLIST.${JAVA3D_ARCH}
INSTALLATION_DIRS+=	${JAVA_PREFIX}
WRKSRC=			${WRKDIR}
NO_BUILD=		yes
NO_CONFIGURE=		yes

include ../../pkgtools/pax/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/sysdep/java.mk
include ../../mk/robotpkg.mk

pre-extract:
	${RUN} test -x ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} ||		\
		${CHMOD} +x ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX};

do-install:
	${RUN} cd ${WRKSRC} && ${PAX} -rwp ma lib ${JAVA_PREFIX}
