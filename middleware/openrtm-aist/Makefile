# robotpkg Makefile for:	middleware/openrtm-aist
# Created:			Anthony Mallet on Wed, 23 Jan 2008
#

PKGREVISION=		2
RTM_VERSION=		1.1.1
DISTNAME=		OpenRTM-aist-${RTM_VERSION}
PKGNAME=		openrtm-aist-${RTM_VERSION}
CATEGORIES=		middleware
MASTER_SITES=		http://openrtm.org/pub/OpenRTM-aist/cxx/${RTM_VERSION}/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.openrtm.org
COMMENT=		Open Robot Technology Middleware from AIST.
LICENSE=		gnu-lgpl-v2.1

MAKE_JOBS_SAFE=		no

# Archive contains pax extended attributes - sadly, NetBSD pax (and maybe
# others) does not support them.
DEPEND_ABI.gtar=       gtar>=1.14
DEPEND_METHOD.gtar=    bootstrap
EXTRACT_USING=         ${GTAR}

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-omniorb=${PREFIX.omniORB}
CONFIGURE_ARGS+=        --with-ace-includes=${PREFIX.ace}
CONFIGURE_ARGS+=        --with-ace-lib=${PREFIX.ace}
CONFIGURE_ARGS+=        --with-libs=$(dir $(filter %.so,${SYSTEM_FILES.omniORB}))

SUBST_CLASSES+=		rtm-python
SUBST_STAGE.rtm-python=	pre-configure
SUBST_MESSAGE.rtm-python=\
	Replacing python interpreter.
SUBST_SED.rtm-python=\
	'1s@^\\\#!.*python@\\\#!${PYTHON}@'
SUBST_FILES.rtm-python=\
	build/*.py				\
	utils/rtc-template/*.py			\
	utils/rtc-template/rtc-template		\
	utils/rtm-skelwrapper/*.py		\
	utils/rtm-skelwrapper/rtm-skelwrapper

# Remove dynamic throw() specs. sed program matches multiline patterns
SUBST_CLASSES+=		throw
SUBST_STAGE.throw=	post-patch
SUBST_MESSAGE.throw=\
	Removing dynamic exception specification.
SUBST_SED.throw=\
	-e 's/throw[ \t]*([^)]*)//g'			\
	-e '/throw[ \t]*([^)]*$$/,/^[^)]*)/{//!d;s///;}'
SUBST_FILES.throw=\
	src/lib/coil/posix/coil/Allocator.h		\
	src/lib/coil/posix/coil/Allocator.cpp		\
	src/lib/rtm/*.h					\
	src/lib/rtm/*.cpp				\
	examples/SimpleService/MyServiceSVC_impl.h	\
	examples/SimpleService/MyServiceSVC_impl.cpp


DEPEND_ABI.python=	python<3
include ../../mk/sysdep/python.mk

include ../../devel/boost-headers/depend.mk
include ../../middleware/ace/depend.mk
include ../../middleware/ace/depend.mk
include ../../middleware/omniORB/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/sysdep/gtar.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
