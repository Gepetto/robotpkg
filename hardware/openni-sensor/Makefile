# robotpkg Makefile for:	hardware/openni-sensor
# Created:			Matthieu Herrb on Mon, 13 Dec 2010
#

COMMIT=		7a39cd
DISTNAME=	openni-sensor-${VERSION}
VERSION=	20101214.${COMMIT}
PKGREVISION=	1
CATEGORIES=	hardware image
MASTER_SITES=	https://github.com/ros-pkg-git/Sensor.git@${COMMIT}
FETCH_METHOD=	git

COMMENT=	Primesense OpenNI Sensor Engine
HOMEPAGE=	http://openni.org
LICENSE=	gnu-lgpl-v3
MAINTAINER=	openrobots@laas.fr

MAKE_JOBS_SAFE=		no
USE_LANGUAGES=		c c++
BUILD_DIRS=		Platform/Linux-x86/Build
INSTALLATION_DIRS=	bin lib share/openni etc/udev/rules.d

UDEV_RULES=	55-primesense-usb.rules
MESSAGE_SUBST=	UDEV_RULES=${UDEV_RULES}

OPENNI=		$(WRKDIR)
OPENNI_LIB=	$(PREFIX)/lib
OPENNI_SHARE=	$(PREFIX)/share/openni

ENGINE_BIN=	${PREFIX.openni}/bin
ENGINE_LIB=	${WRKDIR}/lib
OPENNI_LIB=	${PREFIX.openni}/lib

SUBST_CLASSES+=		core-libs
SUBST_STAGE.core-libs=	post-extract
SUBST_MESSAGE.core-libs=Patching the output library for the core libraries
SUBST_SED.core-libs=\
	-e 's!BIN_DIR = ../../Bin!CFG=lib\nCFLAGS+=-O3 -msse${SSE_GENERATION}\nLDFLAGS+=-Wl,-rpath,$(OPENNI_LIB) -Wl,-rpath,$(ENGINE_LIB)\nLIB_DIRS=$(OPENNI_LIB)\nBIN_DIR=$(WRKDIR)!g' \
	-e 's!/usr/include/ni/CommonMakefile!$(PREFIX.openni)/include/ni/CommonMakefile!g' \
	-e 's!/usr/include!$(PREFIX.openni)/include!g'
SUBST_FILES.core-libs = Platform/Linux-x86/Build/EngineLibMakefile

SUBST_CLASSES += xnserver
SUBST_STAGE.xnserver = post-extract
SUBST_MESSAGE.xnserver = Patching the output library for XnServer...
SUBST_SED.xnserver = \
	-e 's!BIN_DIR = ../../../Bin!CFG=bin\nCFLAGS+=-O3 -msse${SSE_GENERATION}\nLDFLAGS+=-Wl,-rpath,$(OPENNI_LIB) -Wl,-rpath,$(ENGINE_LIB)\nLIB_DIRS=$(OPENNI_LIB) $(ENGINE_LIB)\nBIN_DIR=$(WRKDIR)!g' \
	-e 's!/usr/include/ni/CommonMakefile!$(PREFIX.openni)/include/ni/CommonMakefile!g' \
	-e 's!/usr/include!$(PREFIX.openni)/include!g'
SUBST_FILES.xnserver = Platform/Linux-x86/Build/Utils/EngineUtilMakefile

SUBST_CLASSES += sensor
SUBST_STAGE.sensor = post-extract
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

# XXX the niReg process should be handled in INSTALL/DEINSTALL scripts
do-install:
	${INSTALL} ${WRKDIR}/bin/XnSensorServer ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/Data/GlobalDefaults.ini \
		${PREFIX}/share/openni
	@for file in libXnCore.so libXnDDK.so libXnFormats.so ; do \
		echo "Installing $$file"; \
		${INSTALL} ${WRKDIR}/lib/$$file ${PREFIX}/lib ; \
	done
	@cd ${WRKSRC} ; \
	for file in `cat Platform/Linux-x86/CreateRedist/install.sh | grep MODULES= | sed 's/\"//g' | awk -F "=" {'print $$2'}`; do \
		echo "Installing $$file"; \
		${INSTALL} ${WRKDIR}/lib/$$file ${PREFIX}/lib ; \
		${PREFIX}/bin/niReg -r ${PREFIX}/lib/$$file ${OPENNI_SHARE}; \
	done
	${INSTALL_DATA} ${FILESDIR}/${UDEV_RULES} \
	  ${PREFIX}/etc/udev/rules.d

include ../../middleware/openni/depend.mk
include ../../pkgtools/install-sh/depend.mk

DEPEND_ABI.openni+=	~sse${SSE_GENERATION}

include ../../mk/robotpkg.mk
