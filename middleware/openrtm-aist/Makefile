# robotpkg Makefile for:	middleware/openrtm-aist
# Created:			Anthony Mallet on Wed, 23 Jan 2008
#

RTM_VERSION=		0.4.2
PKGREVISION=		2
DISTNAME=		OpenRTM-aist-${RTM_VERSION}-RELEASE
PKGNAME=		openrtm-aist-${RTM_VERSION}
CATEGORIES=		middleware
MASTER_SITES=		http://www.openrtm.org/pub/OpenRTM-aist/cxx/${RTM_VERSION}/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.is.aist.go.jp/rt/OpenRTM-aist/html-en/FrontPage.html
COMMENT=		Open Robot Technology Middleware from AIST.
LICENSE=		gnu-lgpl-v2.1

MAKE_JOBS_SAFE=		no
USE_LANGUAGES+=		c c++

WRKSRC=			${WRKDIR}/${DISTNAME:-RELEASE=}

# Archive contains pax extended attributes - sadly, NetBSD pax (and maybe
# others) does not support them.
DEPEND_ABI.gtar=	gtar>=1.14
DEPEND_METHOD.gtar=	bootstrap
EXTRACT_USING=		${GTAR}

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-omniorb=${PREFIX.omniORB}


# Use the preferred version of Ace.
#  If not defined, OpenRTM will use the system package even if Ace
#  is installed by RobotPkg which is not what is expected.
CONFIGURE_ARGS+=        --with-ace-includes=${PREFIX.ace} \
                        --with-ace-lib=${PREFIX.ace}

SUBST_CLASSES+=		rtm-python
SUBST_STAGE.rtm-python=	pre-configure
SUBST_MESSAGE.rtm-python=Replacing python interpreter.
SUBST_SED.rtm-python=	'1s@^\\\#![[:space:]]*/usr/bin/env python@\\\#!${PYTHON}@'
SUBST_FILES.rtm-python=\
	build/*.py 				\
	utils/rtc-template/*.py			\
	utils/rtc-template/rtc-template		\
	utils/rtm-skelwrapper/*.py		\
	utils/rtm-skelwrapper/rtm-skelwrapper

DEPEND_ABI.python=	python<3
include ../../mk/sysdep/python.mk

include ../../middleware/ace/depend.mk
include ../../middleware/omniORB/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/sysdep/gtar.mk
include ../../mk/robotpkg.mk
