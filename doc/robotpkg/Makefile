# $LAAS: Makefile 2009/01/18 23:22:04 tho $
#
# Copyright (c) 2009 LAAS/CNRS
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
#                                      Anthony Mallet on Sat Jan 10 2009
#

DISTNAME=               robotpkg-guide-${PKGVERSION}
CATEGORIES=             doc
MASTER_SITES=#		empty
DISTFILES=#		empty

MAINTAINER=             openrobots@laas.fr
HOMEPAGE=               http://www.laas.fr/~mallet/robotpkg
COMMENT=                A guide to robotpkg

include ../../mk/robotpkg.prefs.mk

PKGVERSION:=		$(shell ${DATE} '+%Y%m%d')
DIST_SUBDIR=            ${PKGBASE}
USE_LANGUAGES=#		empty

PLIST_SRC=              ${WRKDIR}/PLIST_DYNAMIC
DOCDIR=                 ${PREFIX}/share/doc/robotpkg

OUTPUTS?=		pdf
BUILD_TARGET=		$(sort ${OUTPUTS})

ifneq (,$(filter regen,${MAKECMDGOALS}))
BUILD_TARGET+=		html txt
endif

# option for pdf output
PKG_SUPPORTED_OPTIONS+= pdf
PKG_SUGGESTED_OPTIONS+= pdf
PKG_OPTION_DESCR.pdf=	Generate PDF output
define PKG_OPTION_SET.pdf
  OUTPUTS+=	pdf
  MAKE_ENV+=	PDFLATEX=$(call quote,${PDFLATEX})
  include ../../mk/sysdep/pdflatex.mk
endef

# option for html output
PKG_SUPPORTED_OPTIONS+= html
PKG_OPTION_DESCR.html=	Generate HTML output
define PKG_OPTION_SET.html
  OUTPUTS+=	html
  MAKE_ENV+=	PDFLATEX=$(call quote,${PDFLATEX})
  MAKE_ENV+=	TTH=$(call quote,${TTH})
  include ../../mk/sysdep/pdflatex.mk
  include ../../sysutils/tth/depend.mk
endef

# option for text output
PKG_SUPPORTED_OPTIONS+= txt
PKG_OPTION_DESCR.txt=	Generate ASCII text output
define PKG_OPTION_SET.txt
  OUTPUTS+=	txt
  MAKE_ENV+=	PDFLATEX=$(call quote,${PDFLATEX})
  MAKE_ENV+=	TTH=$(call quote,${TTH})
  MAKE_ENV+=	W3M=$(call quote,${W3M})
  include ../../mk/sysdep/pdflatex.mk
  include ../../sysutils/tth/depend.mk
  include ../../mk/sysdep/w3m.mk
endef

include ../../mk/robotpkg.mk

# The source files are only symlinked into the WRKSRC, so that they can
# be easily modified, should the build phase fail.
#
pre-extract:
	${MKDIR} ${WRKSRC}
	${LN} -s ${FILESDIR}/* ${WRKSRC}

# install the single-file HTML and ascii output into the robotpkg doc/
# directory, for distribution with robotpkg.
#
# note that this uses ${CP} and not ${INSTALL_DATA} because the files
# stay in the development directories and have nothing to do with
# the permissions or ownership of installed files.
#
regen: build
	${CP} ${WRKSRC}/robotpkg.html ${ROBOTPKG_DIR}/doc
	${CP} ${WRKSRC}/robotpkg.txt ${ROBOTPKG_DIR}/doc
