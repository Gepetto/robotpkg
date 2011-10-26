# robotpkg Makefile for:	image/coriander
# Created:			Anthony Mallet on Mon, 23 Jun 2008
#

DISTNAME=		coriander-2.0.0-rc6
PKGNAME=		coriander-2.0.0rc6
PKGREVISION=		1
CATEGORIES=		image
MASTER_SITES=		http://damien.douxchamps.net/ieee1394/coriander/archives/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://damien.douxchamps.net/ieee1394/coriander/
COMMENT=		Graphical user interface for controlling FireWire cameras
LICENSE=		gnu-gpl-v2

ONLY_FOR_PLATFORM=	Linux-%
GNU_CONFIGURE=		yes

include ../../image/libdc1394/depend.mk
include ../../image/libraw1394/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/libgnomeui.mk
include ../../mk/robotpkg.mk
