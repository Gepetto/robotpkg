# robotpkg Makefile for:	devel/jafar-kernel
# Created:			Redouane Boumghar on Thu, 17 Mar 2011
#

JAFAR_PKG=		kernel-0.6
PKGREVISION=		1

CATEGORIES=		devel
JAFAR_COMMENT=		common tools (exceptions, logging facility ...)

include ../../meta-pkgs/jafar/Makefile.common

# Fix .pc with correct boost library
SUBST_STAGE.fix-boost=	pre-configure
SUBST_MESSAGE.fix-boost=Fixing boost library names in pkg-config file
SUBST_FILES.fix-boost+=	jafar-kernel.pc.in
SUBST_SED.fix-boost=\
  -e 's@-lboost_@-L${PREFIX.boost-libs}/lib &@'		\
  -e 's/-lboost_[a-z0-9_]*/&${BOOST_LIB_SUFFIX}/g'

SUBST_CLASSES+=	fix-boost

include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
