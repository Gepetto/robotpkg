# robotpkg Makefile for:	hardware/openni-sensor
# Created:			Matthieu Herrb on Mon, 13 Dec 2010
#

PKGREVISION=	1
COMMIT=		50b8b2d
VERSION=	5.1.0.41
DISTNAME=	openni-sensor-${VERSION}
MASTER_SITES=\
	${MASTER_SITE_GITHUB:=PrimeSense/Sensor/tarball/Stable-${VERSION}?f=}

HOMEPAGE=	http://openni.org
COMMENT=	Primesense OpenNI Sensor Engine
CATEGORIES=	hardware image
LICENSE=	gnu-lgpl-v3
MAINTAINER=	openrobots@laas.fr

MAKE_JOBS_SAFE=		no
WRKSRC=			${WRKDIR}/PrimeSense-Sensor-${COMMIT}
BUILD_DIRS=		Platform/Linux/Build
INSTALLATION_DIRS=	bin lib share/openni etc/udev/rules.d

NIREG=		${PREFIX.openni}/bin/niReg
NILICENSE=	${PREFIX.openni}/bin/niLicense

include ../../mk/robotpkg.prefs.mk

ifeq (${MACHINE_ARCH},x86_64)
  NI_ARCH=x64
else ifeq (${MACHINE_ARCH},i386)
  NI_ARCH=x86
else
  PKG_FAIL_REASON+=	"Architecture not supported"
endif

UDEV_RULES=	55-primesense-usb.rules
MESSAGE_SUBST=	UDEV_RULES=${UDEV_RULES}

OPENNI=		$(WRKDIR)
OPENNI_LIB=	$(PREFIX)/lib
OPENNI_SHARE=	$(PREFIX)/share/openni

ENGINE_BIN=	${PREFIX}/bin
ENGINE_LIB=	${WRKDIR}/lib
OPENNI_LIB=	${PREFIX}/lib

SUBST_CLASSES+=		core-libs
SUBST_STAGE.core-libs=	pre-patch
SUBST_MESSAGE.core-libs=Patching the output library for the core libraries
SUBST_SED.core-libs=\
	-e 's!BIN_DIR = ../../Bin!LIB_DIRS=$(OPENNI_LIB)\nBIN_DIR=$(WRKDIR)!g' \
	-e 's!/usr/include!$(PREFIX)/include!g'
SUBST_FILES.core-libs = Platform/Linux/Build/EngineLibMakefile

SUBST_CLASSES += xnserver
SUBST_STAGE.xnserver = pre-patch
SUBST_MESSAGE.xnserver = Patching the output library for XnServer...
SUBST_SED.xnserver = \
	-e 's!BIN_DIR = ../../../Bin!LIB_DIRS=$(OPENNI_LIB) $(ENGINE_LIB)\nBIN_DIR=$(WRKDIR)!g' \
	-e 's!/usr/include!$(PREFIX)/include!g'
SUBST_FILES.xnserver = Platform/Linux/Build/Utils/EngineUtilMakefile

SUBST_CLASSES += sensor
SUBST_STAGE.sensor = pre-patch
SUBST_MESSAGE.sensor = Patching the output directory for sensor
SUBST_SED.sensor = -e 's!/usr/bin!$(ENGINE_BIN)!g'
SUBST_FILES.sensor = Source/XnDeviceSensorV2/XnSensorClient.cpp

# options
PKG_OPTIONS_REQUIRED_GROUPS+=	sse
PKG_SUGGESTED_OPTIONS+=		sse3
PKG_OPTIONS_GROUP.sse=		sse2 sse3

PKG_OPTION_DESCR.sse3?=	Use Streaming SIMD Extensions 3 (sse3)
PKG_OPTION_SET.sse3:=	SSE_GENERATION=3

PKG_OPTION_DESCR.sse2?=	Use Streaming SIMD Extensions 2 (sse2)
PKG_OPTION_SET.sse2:=	SSE_GENERATION=2

# INSTALL/DEINSTALL script
INSTALL_VARS+=	ECHO SED SORT TEST NIREG NILICENSE
INSTALL_SRC+=	${WRKDIR}/register
DEINSTALL_SRC+=	${WRKDIR}/register

include ../../middleware/openni/depend.mk
include ../../pkgtools/install-sh/depend.mk

DEPEND_ABI.openni+=	~sse${SSE_GENERATION}

include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

do-install:
	${INSTALL} ${WRKDIR}/${NI_ARCH}-Release/XnSensorServer ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/Data/GlobalDefaults.ini \
		${PREFIX}/share/openni
	@for file in libXnCore.so libXnDDK.so libXnFormats.so ; do \
		echo "Installing $$file"; \
		${INSTALL} ${WRKDIR}/${NI_ARCH}-Release/$$file ${PREFIX}/lib ; \
	done
	${RUN}cd ${WRKSRC}/Platform/Linux/CreateRedist;			\
	files=`awk -F '=?\"' '/MODULES=.*\.so/ {print $$2}' install.sh`;\
	for file in $$files; do						\
		echo "Installing $$file"; \
		${INSTALL} ${WRKDIR}/${NI_ARCH}-Release/$$file ${PREFIX}/lib ; \
	done
	${INSTALL_DATA} ${FILESDIR}/${UDEV_RULES} \
	  ${PREFIX}/etc/udev/rules.d

.PHONY: ${WRKDIR}/register
${WRKDIR}/register: ${ROBOTPKG_DIR}/middleware/openni/files/register
	${RUN} cd ${WRKSRC}; exec >$@;					\
	${CAT} $^;							\
	cd ${WRKSRC}/Platform/Linux/CreateRedist;			\
	files=`awk -F '=?\"' '/MODULES=.*\.so/ {print $$2}' install.sh`;\
	for file in $$files; do						\
	  ${ECHO} '# NIREG:' lib/$$file ${OPENNI_SHARE};		\
	done
