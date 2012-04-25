# robotpkg Makefile for:	devel/jsoncpp
# Created:			Anthony Mallet on Tue, 18 Oct 2011
#

DISTNAME=		jsoncpp-src-0.5.0
PKGNAME=		$(subst -src,,${DISTNAME})
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=jsoncpp/}

COMMENT=		JSON parser, serialization and unserialization library
HOMEPAGE=		http://jsoncpp.sourceforge.net/
LICENSE=		public-domain
MAINTAINER=		openrobots@laas.fr

NOT_FOR_PLATFORM=	# empty
USE_LANGUAGES=		c c++
GNU_CONFIGURE=		yes

# Fix header include path
SUBST_CLASSES+=		hpath
SUBST_STAGE.hpath=	pre-configure
SUBST_MESSAGE.hpath=	Fixing header include path
SUBST_SED.hpath=	'/\#[ \t]*include[ \t]*\"/s@\"\([^\"]*\"\)@\"json/\1@g'
SUBST_FILES.hpath=	include/json/*

# Doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  post-build: doc-build
  post-install: doc-install

  INSTALLATION_DIRS+=	share/doc/${PKGBASE}
  DOXYGEN_PLIST_DIR+=	share/doc/${PKGBASE}
  include ../../pkgtools/pax/depend.mk
  include ../../mk/sysdep/doxygen.mk
  include ../../mk/sysdep/graphviz.mk
  include ../../mk/sysdep/python.mk
endef

include ../../mk/sysdep/autoconf.mk
include ../../mk/sysdep/automake.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/robotpkg.mk

# Replace the bundled scons scripts by a good old autoconf script that will
# more easily build the ~3 required cpp files on the required platforms than
# a dozen of obscure patches.
#
post-extract:
	${RUN} ${CP} ${FILESDIR}/configure.ac ${FILESDIR}/Makefile.am	\
		${WRKSRC}/.

pre-configure: autoreconf

doc-build:
	${RUN} cd ${WRKSRC} && ${BUILD_LOGFILTER}			\
		${PYTHON} doxybuild.py					\
		--dot=${PREFIX.graphviz}/dot --doxygen=${DOXYGEN}	\
		--with-dot

doc-install:
	${RUN} cd ${WRKSRC} &&						\
	cd dist/doxygen/jsoncpp-api-html-${PKGVERSION_NOREV} &&		\
	${INSTALL_LOGFILTER}						\
		${PAX} -v -r -w -p m . ${PREFIX}/${DOXYGEN_PLIST_DIR}/.
