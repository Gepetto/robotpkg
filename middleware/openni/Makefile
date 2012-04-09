# robotpkg Makefile for:	hardware/openni
# Created:			Matthieu Herrb on Mon, 13 Dec 2010
#

COMMIT=		151607
PKG_VERSION=	20120104.${COMMIT}
DISTNAME=	openni-${PKG_VERSION}
MASTER_SITES=	https://github.com/OpenNI/OpenNI.git@${COMMIT}
FETCH_METHOD=	git

HOMEPAGE=	http://openni.org
COMMENT=	Primesense OpenNI framework for Natural Interaction
CATEGORIES=	middleware image
LICENSE=	gnu-lgpl-v3

NOT_FOR_PLATFORM=	NetBSD-%	# missing libusb1

USE_LANGUAGES=		c c++

OPENNI_SHARE=		${PREFIX}/share/openni

include ../../mk/robotpkg.prefs.mk

ifeq (${MACHINE_ARCH},x86_64)
  NI_ARCH=x64
else ifeq (${MACHINE_ARCH},i386)
  NI_ARCH=x86
else
  PKG_FAIL_REASON+=	"Architecture not supported"
endif

BUILD_DIRS=		Platform/Linux/Build
MAKE_FLAGS+=		BIN_DIR=${WRKDIR}
MAKE_FLAGS+=		CFG=Release

MAKE_JOBS_SAFE=		no

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
	-e 's!/var/lib/ni/!$(OPENNI_SHARE)/!g'
SUBST_FILES.xml = \
	Source/OpenNI/XnOpenNI.cpp

SUBST_CLASSES += data-xml
SUBST_STAGE.data-xml = pre-patch
SUBST_MESSAGE.data-xml = Patching the location of SamplesConfig.xml...
SUBST_SED.data-xml = \
	-e 's!../../../../Data/\(SamplesConfig.xml\)!$(OPENNI_SHARE)/\1!g'
SUBST_FILES.data-xml = \
	Samples/NiAudioSample/NiAudioSample.cpp \
	Samples/NiCRead/NiCRead.c \
	Samples/NiHandTracker/main.cpp \
	Samples/NiRecordRaw/NiRecordRaw.cpp \
	Samples/NiRecordSynthetic/NiRecordSynthetic.cpp \
	Samples/NiSimpleRead/NiSimpleRead.cpp \
	Samples/NiSimpleSkeleton/NiSimpleSkeleton.cpp \
	Samples/NiSimpleViewer/NiSimpleViewer.cpp \
	Samples/NiUserSelection/UserTracker.cpp \
	Samples/NiUserTracker/main.cpp \
	Samples/NiViewer/NiViewer.cpp

# XXX the niReg process should be handled in INSTALL/DEINSTALL scripts
do-install:
	${RUN}cd ${WRKSRC}/Include;					\
	${PAX} $(if ${VERBOSE},-v) -rwp ma . ${PREFIX}/include/ni;	\
	${INSTALL_DATA} ${WRKSRC}/Data/SamplesConfig.xml		\
		${PREFIX}/share/openni;					\
	cd ${WRKDIR}/${NI_ARCH}-Release;				\
	for file in [Nn]i* Sample-[Nn]i*; do				\
	  $(if ${VERBOSE},${ECHO} "Installing $$file";)			\
	  ${INSTALL_PROGRAM} $$file ${PREFIX}/bin;			\
	done;								\
	for file in lib*.so; do						\
	  $(if ${VERBOSE},${ECHO} "Installing $$file";)			\
	  ${INSTALL_LIB} $$file ${PREFIX}/lib;				\
	done;								\
	cd ${WRKSRC}/Platform/Linux/CreateRedist;			\
	files=`awk -F '=?\"' '/MODULES=.*\.so/ { print $$2 }' install.sh`;	\
	for file in $$files; do						\
	  $(if ${VERBOSE},${ECHO} "Registering $$file";)		\
	  ${PREFIX}/bin/niReg -r ${PREFIX}/lib/$$file ${OPENNI_SHARE};	\
	done

# options
PKG_OPTIONS_REQUIRED_GROUPS+=	sse
PKG_SUGGESTED_OPTIONS+=		sse3
PKG_OPTIONS_GROUP.sse=		sse2 sse3

PKG_OPTION_DESCR.sse3?=	Use Streaming SIMD Extensions 3 (sse3)
PKG_OPTION_SET.sse3:=	MAKE_FLAGS+=SSE_GENERATION=3

PKG_OPTION_DESCR.sse2?=	Use Streaming SIMD Extensions 2 (sse2)
PKG_OPTION_SET.sse2:=	MAKE_FLAGS+=SSE_GENERATION=2

include ../../mk/sysdep/freeglut.mk
include ../../mk/sysdep/libusb1.mk
include ../../pkgtools/install-sh/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../mk/robotpkg.mk
