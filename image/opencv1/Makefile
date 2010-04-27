# $LAAS: Makefile 2010/04/27 23:11:00 tho $
#
# Copyright (c) 2007-2010 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
#                                      Anthony Mallet on Sun Jan 28 2007
#

PKGVERSION=		1.1pre1
DISTNAME=		opencv-${PKGVERSION}
PKGNAME=		opencv1-${PKGVERSION}
CATEGORIES=		image
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=opencvlibrary/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://opencvlibrary.sourceforge.net/
COMMENT=		Library for computer vision problems
CONFLICTS+=		opencv

WRKSRC=			${WRKDIR}/opencv-1.1.0

USE_LANGUAGES+=		c c++
USE_PKGLOCALEDIR=	yes
INSTALLATION_DIRS+=	share/doc/opencv/papers share/doc/opencv/ref/pics \
			share/opencv/haarcascades

GNU_CONFIGURE=		yes
PKGCONFIG_OVERRIDE+=	opencv.pc.in

SUBST_CLASSES+=		py
SUBST_STAGE.py=		pre-configure
SUBST_FILES.py=		samples/python/*.py
SUBST_SED.py=		-e 's,/usr/bin/python,/usr/bin/env python,'

CONFIGURE_ARGS+=	--without-swig
CONFIGURE_ARGS+=	--without-python
CONFIGURE_ARGS+=	--without-1394libs

# ffmpeg raises a compilation problem. Deactivate for now.
CONFIGURE_ARGS+=	--without-ffmpeg

# option for gtk display
PKG_SUPPORTED_OPTIONS+=	gtk
PKG_SUGGESTED_OPTIONS+=	gtk

PKG_OPTION_DESCR.gtk=	Enable gtk+ 2.0 windows.
define PKG_OPTION_SET.gtk
  CONFIGURE_ARGS+=	--with-gtk
  include ../../mk/sysdep/gtk.mk
endef
define PKG_OPTION_UNSET.gtk
  CONFIGURE_ARGS+=	--without-gtk
endef

include ../../pkgtools/pkg-config/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/robotpkg.mk
