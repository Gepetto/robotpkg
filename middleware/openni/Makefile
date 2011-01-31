# robotpkg Makefile for:	hardware/openni
# Created:			Matthieu Herrb on Mon, 13 Dec 2010
#

COMMIT= 43c256
PKG_VERSION= 20101213.${COMMIT}
COMMENT= Primesense OpenNI framework for Natural Interaction
CATEGORIES = middleware image
LICENSE = gnu-lgpl-v3

DISTNAME= openni-${PKG_VERSION}
HOMEPAGE= http://openni.org

FETCH_BEFORE_ARGS= -v
FETCH_METHOD= git
MASTER_SITES= https://github.com/OpenNI/OpenNI.git@${COMMIT}

USE_LANGUAGES= c c++

OPENNI= $(WRKDIR)
OPENNI_LIB= $(PREFIX)/lib
OPENNI_SHARE= $(PREFIX)/share/openni

BUILD_DIRS = Platform/Linux-x86/Build

SUBST_CLASSES += output-lib
SUBST_STAGE.output-lib = post-extract
SUBST_MESSAGE.output-lib = Patching the output library for OpenNI...
SUBST_SED.output-lib = \
    -e 's!BIN_DIR = ../../Bin!CFG=lib\nCFLAGS+=-O3 -msse3\nBIN_DIR=$(OPENNI)!g'
SUBST_FILES.output-lib = \
	Platform/Linux-x86/Build/OpenNI/Makefile

SUBST_CLASSES += output-modules
SUBST_STAGE.output-modules = post-extract
SUBST_MESSAGE.output-modules = Patching the output library for all modules...
SUBST_SED.output-modules = \
    -e 's!BIN_DIR = ../../../Bin!CFG=lib\nCFLAGS+=-O3 -msse3\n\nLDFLAGS+=-Wl,-rpath,$(OPENNI_LIB)\nBIN_DIR=$(OPENNI)!g'
SUBST_FILES.output-modules = \
	Platform/Linux-x86/Build/Modules/nimCodecs/Makefile \
	Platform/Linux-x86/Build/Modules/nimMockNodes/Makefile \
	Platform/Linux-x86/Build/Modules/nimRecorder/Makefile

SUBST_CLASSES += samples
SUBST_STAGE.samples = post-extract
SUBST_MESSAGE.samples = Patching the output location for samples programs...
SUBST_SED.samples = -e 's!BIN_DIR = ../../../Bin!CFG=bin\nCFLAGS+=-O3 -msse3\nLDFLAGS+=-Wl,-rpath,$(OPENNI_LIB)\nLIB_DIRS=$(OPENNI)/lib\nBIN_DIR=$(OPENNI)!g'
SUBST_FILES.samples = \
	Platform/Linux-x86/Build/Samples/NiViewer/Makefile \
	Platform/Linux-x86/Build/Samples/NiAudioSample/Makefile \
	Platform/Linux-x86/Build/Samples/NiBackRecorder/Makefile \
	Platform/Linux-x86/Build/Samples/NiConvertXToONI/Makefile \
	Platform/Linux-x86/Build/Samples/NiCRead/Makefile \
	Platform/Linux-x86/Build/Samples/NiRecordSynthetic/Makefile \
	Platform/Linux-x86/Build/Samples/NiSimpleCreate/Makefile \
	Platform/Linux-x86/Build/Samples/NiSimpleRead/Makefile \
	Platform/Linux-x86/Build/Samples/NiSimpleViewer/Makefile \
	Platform/Linux-x86/Build/Samples/NiUserTracker/Makefile \
	Platform/Linux-x86/Build/Utils/niLicense/Makefile \
	Platform/Linux-x86/Build/Utils/niReg/Makefile 

SUBST_CLASSES += lib-samples
SUBST_STAGE.lib-samples = post-extract
SUBST_MESSAGE.lib-samples = Patching the output location for sample library...
SUBST_SED.lib-samples =  -e 's!BIN_DIR = ../../../Bin!CFG=lib\nCFLAGS+=-O3 -msse3\nLDFLAGS+=-Wl,-rpath,$(OPENNI_LIB)\nLIB_DIRS=$(OPENNI)/lib\nBIN_DIR=$(OPENNI)!g'
SUBST_FILES.lib-samples = \
	Platform/Linux-x86/Build/Samples/NiSampleModule/Makefile

SUBST_CLASSES += xml
SUBST_STAGE.xml = post-extract
SUBST_MESSAGE.xml = Patching the location of modules.xml...
SUBST_SED.xml = \
	-e 's!/var/lib/ni/modules.xml!$(OPENNI_SHARE)/modules.xml!g' \
	-e 's!/var/lib/ni/licenses.xml!$(OPENNI_SHARE)/licenses.xml!g'
SUBST_FILES.xml = \
	Source/OpenNI/XnModuleLoader.cpp \
	Source/OpenNI/XnLicensing.cpp

SUBST_CLASSES += data-xml
SUBST_STAGE.data-xml = post-extract
SUBST_MESSAGE.data-xml = Patching the location of SamplesConfig.xml...
SUBST_SED.data-xml = \
	-e 's!../../../../Data/SamplesConfig.xml!$(OPENNI_SHARE)/SamplesConfig.xml!g'
SUBST_FILES.data-xml = \
	Samples/NiAudioSample/NiAudioSample.cpp \
	Samples/NiViewer/NiViewer.cpp \
	Samples/NiRecordSynthetic/NiRecordSynthetic.cpp \
	Samples/NiSimpleViewer/NiSimpleViewer.cpp \
	Samples/NiSimpleRead/NiSimpleRead.cpp \
	Samples/NiUserTracker/main.cpp

INSTALLATION_DIRS = \
	${PREFIX}/bin \
	${PREFIX}/include/ni \
	${PREFIX}/lib \
	${PREFIX}/share/openni

do-install:
	cd ${WRKSRC}/Include; ${PAX} -rwp ma . ${PREFIX}/include/ni
	${INSTALL_DATA} ${WRKSRC}/Data/SamplesConfig.xml ${PREFIX}/share/openni
	${INSTALL_DATA} ${WRKSRC}/Platform/Linux-x86/Build/CommonMakefile \
		${PREFIX}/include/ni
	cd ${WRKDIR}/bin; ${PAX} -rwp ma . ${PREFIX}/bin
	cd ${WRKDIR}/lib; ${PAX} -rwp ma . ${PREFIX}/lib
	@cd ${WRKSRC}; for file in `cat Platform/Linux-x86/CreateRedist/install.sh | grep MODULES= | sed 's/\"//g' | awk -F "=" {'print $$2'}`; do \
		echo "Installing $$file"; \
		${PREFIX}/bin/niReg -r ${PREFIX}/lib/$$file ${OPENNI_SHARE}; \
	done

include ../../mk/sysdep/freeglut.mk
include ../../mk/sysdep/libusb1.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/robotpkg.mk
