# robotpkg Makefile for:	hardware/openni
# Created:			Matthieu Herrb on Mon, 13 Dec 2010
#

PKGREVISION=	1
VERSION=	2.2-beta2
DISTNAME=	openni2-$(subst -,,${VERSION})
DISTFILES=	${VERSION}${EXTRACT_SUFX}
DIST_SUBDIR=	openni2
MASTER_SITES=	${MASTER_SITE_GITHUB:=occipital/OpenNI2/archive/}

HOMEPAGE=	http://structure.io/
COMMENT=	Primesense OpenNI framework for Natural Interaction
CATEGORIES=	middleware image
LICENSE=	apache-2.0

ONLY_FOR_PLATFORM+=	Linux-%

WRKSRC=			${WRKDIR}/OpenNI2-${VERSION}
MAKE_JOBS_SAFE=		no
INSTALLATION_DIRS=	bin share/java
INSTALLATION_DIRS+=	include/openni2/Driver include/openni2/Linux-x86
INSTALLATION_DIRS+=	lib/OpenNI2/Drivers

# options
PKG_OPTIONS_REQUIRED_GROUPS+=	sse
PKG_SUGGESTED_OPTIONS+=		sse3
PKG_OPTIONS_GROUP.sse=		sse2 sse3

PKG_OPTION_DESCR.sse3?=	Use Streaming SIMD Extensions 3 (sse3)
PKG_OPTION_SET.sse3:=	MAKE_FLAGS+=SSE_GENERATION=3

PKG_OPTION_DESCR.sse2?=	Use Streaming SIMD Extensions 2 (sse2)
PKG_OPTION_SET.sse2:=	MAKE_FLAGS+=SSE_GENERATION=2

INCLUDE_DIRS.libusb1=	include
INCLUDE_DIRS.freeglut=	include
LIBRARY_DIRS.libusb1=	lib
LIBRARY_DIRS.freeglut=	lib
RPATH_DIRS.libusb1=	lib
RPATH_DIRS.freeglut=	lib

include ../../mk/sysdep/freeglut.mk
include ../../mk/sysdep/libudev.mk
include ../../mk/sysdep/libusb1.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/language/java.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

OPENNI_HEADERS=\
	OniCAPI.h OniCEnums.h OniCProperties.h OniCTypes.h OniEnums.h	\
	OniPlatform.h OniProperties.h OniVersion.h OpenNI.h PS1080.h	\
	PSLink.h PrimeSense.h						\
	Driver/OniDriverAPI.h Driver/OniDriverTypes.h			\
	Linux-x86/OniPlatformLinux-x86.h

OPENNI_LIBS=\
	libOpenNI2.so libMWClosestPoint.so libOpenNI2.jni.so		\
	OpenNI2/Drivers/libPS1080.so OpenNI2/Drivers/libDummyDevice.so	\
	OpenNI2/Drivers/libPSLink.so OpenNI2/Drivers/libOniFile.so

OPENNI_JARS=\
	org.openni.Samples.SimpleViewer.jar org.openni.jar		\
	org.openni.Samples.SimpleViewer

OPENNI_BINS=\
	ClosestPointViewer SimpleRead EventBasedRead SimpleViewer	\
	MWClosestPointApp MultiDepthViewer MultipleStreamRead		\
	NiViewer PS1080Console PSLinkConsole

do-install:
	${RUN}cd ${WRKSRC};						\
	for header in ${OPENNI_HEADERS}; do				\
	  ${INSTALL_DATA} Include/$$header				\
	    ${DESTDIR}${PREFIX}/include/openni2/$$header;		\
	done;								\
	for lib in ${OPENNI_LIBS}; do					\
	    ${INSTALL_LIB} Bin/x86-Release/$$lib			\
	      ${DESTDIR}${PREFIX}/lib/$$lib;				\
	done;								\
	for jar in ${OPENNI_JARS}; do					\
	    ${INSTALL_LIB} Bin/x86-Release/$$jar			\
	      ${DESTDIR}${PREFIX}/share/java/$$jar;			\
	done;								\
	for bin in ${OPENNI_BINS}; do					\
	    ${INSTALL_PROGRAM} Bin/x86-Release/$$bin			\
	      ${DESTDIR}${PREFIX}/bin/$$bin;				\
	done
