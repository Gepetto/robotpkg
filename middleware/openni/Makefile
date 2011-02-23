# robotpkg Makefile for:	hardware/openni
# Created:			Matthieu Herrb on Mon, 13 Dec 2010
#

COMMIT=		43c256
PKG_VERSION=	20101213.${COMMIT}
DISTNAME=	openni-${PKG_VERSION}
MASTER_SITES=	https://github.com/OpenNI/OpenNI.git@${COMMIT}
FETCH_METHOD=	git

HOMEPAGE=	http://openni.org
COMMENT=	Primesense OpenNI framework for Natural Interaction
CATEGORIES=	middleware image
LICENSE=	gnu-lgpl-v3

USE_LANGUAGES=		c c++

OPENNI_SHARE=		${PREFIX}/share/openni

BUILD_DIRS=		Platform/Linux-x86/Build
MAKE_FLAGS+=		BIN_DIR=${WRKDIR}
MAKE_FLAGS+=		CFG=Release
MAKE_FLAGS+=		SSE_GENERATION=3 # hardcoded, should be an option

INCLUDE_DIRS.libusb1=	include
INCLUDE_DIRS.freeglut=	include
LIBRARY_DIRS.libusb1=	lib
LIBRARY_DIRS.freeglut=	lib
RPATH_DIRS.libusb1=	lib
RPATH_DIRS.freeglut=	lib

# Installation rpath
RPATH_DIRS=		lib

INSTALLATION_DIRS=\
	bin		\
	include/ni	\
	lib		\
	share/openni

SUBST_CLASSES += xml
SUBST_STAGE.xml = pre-patch
SUBST_MESSAGE.xml = Patching the location of modules.xml...
SUBST_SED.xml = \
	-e 's!/var/lib/ni/\(modules.xml\)!$(OPENNI_SHARE)/\1!g' \
	-e 's!/var/lib/ni/\(licenses.xml\)!$(OPENNI_SHARE)/\1!g'
SUBST_FILES.xml = \
	Source/OpenNI/XnModuleLoader.cpp \
	Source/OpenNI/XnLicensing.cpp

SUBST_CLASSES += data-xml
SUBST_STAGE.data-xml = pre-patch
SUBST_MESSAGE.data-xml = Patching the location of SamplesConfig.xml...
SUBST_SED.data-xml = \
	-e 's!../../../../Data/\(SamplesConfig.xml\)!$(OPENNI_SHARE)/\1!g'
SUBST_FILES.data-xml = \
	Samples/NiAudioSample/NiAudioSample.cpp \
	Samples/NiViewer/NiViewer.cpp \
	Samples/NiRecordSynthetic/NiRecordSynthetic.cpp \
	Samples/NiSimpleViewer/NiSimpleViewer.cpp \
	Samples/NiSimpleRead/NiSimpleRead.cpp \
	Samples/NiUserTracker/main.cpp

do-install:
	${RUN}cd ${WRKSRC}/Include;					\
	${PAX} $(if ${VERBOSE},-v) -rwp ma . ${PREFIX}/include/ni;	\
	${INSTALL_DATA} ${WRKSRC}/Data/SamplesConfig.xml		\
		${PREFIX}/share/openni;					\
	${INSTALL_DATA} ${WRKSRC}/Platform/Linux-x86/Build/CommonMakefile \
		${PREFIX}/include/ni;					\
	cd ${WRKDIR}/Release;						\
	for file in [Nn]i* Sample-[Nn]i*; do				\
	  $(if ${VERBOSE},${ECHO} "Installing $$file";)			\
	  ${INSTALL_PROGRAM} $$file ${PREFIX}/bin;			\
	done;								\
	for file in lib*.so; do						\
	  $(if ${VERBOSE},${ECHO} "Installing $$file";)			\
	  ${INSTALL_LIB} $$file ${PREFIX}/lib;				\
	done;								\
	cd ${WRKSRC}/Platform/Linux-x86/CreateRedist;			\
	files=`awk -F '=?\"' '/^MODULES=/ { print $$2 }' install.sh`;	\
	for file in $$files; do						\
	  $(if ${VERBOSE},${ECHO} "Installing $$file";)			\
	  ${PREFIX}/bin/niReg -r ${PREFIX}/lib/$$file ${OPENNI_SHARE};	\
	done

include ../../mk/sysdep/freeglut.mk
include ../../mk/sysdep/libusb1.mk
include ../../pkgtools/install-sh/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../mk/robotpkg.mk
