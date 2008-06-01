# $LAAS: Makefile 2008/06/01 19:47:59 tho $
#
# Copyright (c) 2008 LAAS/CNRS
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
#                                      Anthony Mallet on Wed Jan 23 2008
#

RTM_VERSION=		0.4.1
DISTNAME=		OpenRTM-aist-${RTM_VERSION}-RELEASE
PKGNAME=		openrtm-aist-${RTM_VERSION}
CATEGORIES=		architecture
MASTER_SITES=		http://www.is.aist.go.jp/rt/OpenRTM-aist/download/CXX/0.4.1/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.is.aist.go.jp/rt/OpenRTM-aist/html-en/FrontPage.html
COMMENT=		Open Robot Technology Middleware from AIST.

DEPENDS+=		ace>=5.6:../../architecture/ace

WRKSRC=			${WRKDIR}/${DISTNAME:-RELEASE=}

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-omniorb=${PREFIX.omniORB}

# replace python interpreter by the one which is installed
USE_TOOLS+=		python

SUBST_CLASSES+=		rtm-python
SUBST_STAGE.rtm-python=	pre-configure
SUBST_MESSAGE.rtm-python=Replacing python interpreter.
SUBST_SED.rtm-python=	'1s@^\\\#![[:space:]]*/usr/bin/env python@\\\#!${TOOLS_PYTHON}@'
SUBST_FILES.rtm-python=\
	build/*.py 				\
	utils/rtc-template/*.py			\
	utils/rtc-template/rtc-template		\
	utils/rtm-skelwrapper/*.py		\
	utils/rtm-skelwrapper/rtm-skelwrapper

include ../../devel/omniORB/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/robotpkg.mk
