# robotpkg Makefile for:	image/libdc1394
# Created:			Anthony Mallet on Sun, 28 Jan 2007
#

DISTNAME=		libdc1394-2.1.2
CATEGORIES=		image
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=libdc1394/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://sourceforge.net/projects/libdc1394/
COMMENT=		Programming interface to control IEEE 1394 based cameras
LICENSE=		gnu-lgpl-v2.1

ONLY_FOR_PLATFORM=	Linux-% Darwin-%-i386

GNU_CONFIGURE=		yes

include ../../mk/robotpkg.prefs.mk
ifeq (Linux,${OS_KERNEL})
  include ../../image/libraw1394/depend.mk
endif
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
