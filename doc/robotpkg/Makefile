# $LAAS: Makefile 2009/01/30 23:23:35 tho $
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

OUTPUTS?=#		empty
BUILD_TARGET=		$(sort ${OUTPUTS})
INSTALL_TARGET=		$(patsubst %,install-%,$(sort ${OUTPUTS}))

# option for pdf output generation
#
PKG_SUGGESTED_OPTIONS+= pdf
PKG_OPTION_DESCR.pdf=	Generate PDF output
define PKG_OPTION_SET.pdf
  OUTPUTS+=	pdf
  include ../../mk/sysdep/pdflatex.mk
endef

# option for html output generation
#
PKG_OPTION_DESCR.html=	Generate HTML output
define PKG_OPTION_SET.html
  OUTPUTS+=	html
  include ../../mk/sysdep/pdflatex.mk
  include ../../sysutils/tth/depend.mk
endef

# option for text output generation
#
PKG_OPTION_DESCR.txt=	Generate ASCII text output
define PKG_OPTION_SET.txt
  OUTPUTS+=	txt
  include ../../mk/sysdep/pdflatex.mk
  include ../../sysutils/tth/depend.mk
  include ../../mk/sysdep/w3m.mk
endef

PKG_OPTIONS_NONEMPTY_SETS=	output
PKG_OPTIONS_SET.output=		html pdf txt

include ../../mk/robotpkg.mk

# The source files are only symlinked into the WRKSRC, so that they can
# be easily modified, should the build phase fail.
#
pre-extract:
	${MKDIR} ${WRKSRC}
	${LN} -s ${FILESDIR}/* ${WRKSRC}


# install the HTML and ASCII output into the robotpkg directory, for
# distribution with robotpkg.
#
# note that this uses ${CP} and not ${INSTALL_DATA} because the files
# stay in the development directories and have nothing to do with
# the permissions or ownership of installed files.
#
regen:
	cd ${WRKSRC} && ${MAKE} html txt
	${CP} ${WRKSRC}/robotpkg.html ${ROBOTPKG_DIR}/README.html
	${CP} ${WRKSRC}/robotpkg.txt ${ROBOTPKG_DIR}/README.txt
