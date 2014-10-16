# robotpkg Makefile for:	middleware/naoqi
# Created:			Séverin Lemaignan on Fri, 20 Sep 2013
#

NAOQI_VERSION=		2.1.0.19
DISTNAME=		naoqi-${NAOQI_VERSION}
CATEGORIES=		middleware
MASTER_SITES=		https://community.aldebaran-robotics.com/

# per arch distfiles
DISTFILES=		naoqi-sdk-${NAOQI_VERSION}-linux32.tar.gz
DISTFILES+=		naoqi-sdk-${NAOQI_VERSION}-linux64.tar.gz
DISTFILES+=		naoqi-sdk-${NAOQI_VERSION}-mac64.tar.gz

RESTRICTED=		Redistribution of source and binaries not permitted
NO_PUBLIC_SRC=		${RESTRICTED}
NO_PUBLIC_BIN=		${RESTRICTED}

MAINTAINER=		severin.lemaignan@epfl.ch
HOMEPAGE=\
  http://www.aldebaran-robotics.com/en/Discover-NAO/Key-Features/NAOqi.html
COMMENT=		Aldebaran middleware for the Nao robot
LICENSE=		aldebaran-license

ONLY_FOR_PLATFORM=	Linux-% Darwin-%
include ../../mk/robotpkg.prefs.mk # for OS_KERNEL, MACHINE_ARCH
ifeq (Linux,${OS_KERNEL})
  ifeq (i386,${MACHINE_ARCH})
    NAOQI_ARCH=	linux32
  else
    NAOQI_ARCH=	linux64
  endif
 else ifeq (Darwin,${OS_KERNEL})
    NAOQI_ARCH=	mac64
endif
FETCH_ONLY=		naoqi-sdk-${NAOQI_VERSION}-${NAOQI_ARCH}.tar.gz

INTERACTIVE_STAGE=	fetch
NO_CONFIGURE=		yes
NO_BUILD=		yes

WRKSRC=			${WRKDIR}/${FETCH_ONLY:.tar.gz=}
PREFIX=			${LOCALBASE}/opt/naoqi

# Fix .la for missing static Qt libraries
SUBST_CLASSES+=		fixqtla
SUBST_STAGE.fixqtla=	post-extract
SUBST_MESSAGE.fixqtla=	Fixing libtool .la files for Qt libraries
SUBST_FILES.fixqtla+=	lib/*.la
SUBST_SED.fixqtla=	-e '/old_library=/d'

include ../../archivers/pax/depend.mk
include ../../mk/robotpkg.mk

do-install:
	${RUN} cd ${WRKSRC} && ${PAX} 2>&1 -v -r -w -p ma . ${PREFIX}/
