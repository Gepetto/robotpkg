# robotpkg Makefile for:	devel/swig
# Created:			Anthony Mallet on Thu,  7 Jul 2011
#

DISTNAME=	swig-2.0.4
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=swig/}

MAINTAINER=	mallet@laas.fr
HOMEPAGE=	http://www.swig.org/
COMMENT=	Simplified Wrapper and Interface Generator
LICENSE=	2-clause-bsd

BUILD_TARGET=		swig
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-pcre-prefix=${PREFIX.pcre}

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  INSTALLATION_DIRS+=	share/doc/swig share/examples/swig
  PLIST_SRC=		${PKGDIR}/PLIST ${PKGDIR}/PLIST.doc
  post-install: swig-install-doc

  include ../../pkgtools/pax/depend.mk
endef

include ../../mk/sysdep/pcre.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

.PHONY: swig-install-doc
swig-install-doc:
	${RUN}cd ${WRKSRC}/Doc/Manual &&				\
	${PAX} -w -r -pm -v . ${DESTDIR}${PREFIX}/share/doc/swig
	${RUN}cd ${WRKSRC}/Examples &&					\
	${PAX} -w -r -pm -v						\
		-s ',.*CVS.*,,'						\
		-s ',.*Makefile\.in$$,,'				\
		-s ',^test-suite.*,,'					\
		. ${DESTDIR}${PREFIX}/share/examples/swig
