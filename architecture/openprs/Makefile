# robotpkg Makefile for:	architecture/openprs
# Created:			Anthony Mallet on Wed, 17 Oct 2007
#

DISTNAME=		openprs-1.0b7
CATEGORIES=		architecture
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=openprs/}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/openprs

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		https://softs.laas.fr/openrobots/wiki/openprs
COMMENT=		Open Source Procedural Reasoning System
LICENSE=		2-clause-bsd

BUILD_DIRS=		${WRKSRC}
INSTALL_DIRS=		${WRKSRC}
INSTALL_TARGET=		install

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-readline=${PREFIX.readline}
CONFIGURE_ARGS+=	--with-motif-includes=${PREFIX.motif}/include
CONFIGURE_ARGS+=	--with-motif-libraries=${PREFIX.motif}/lib

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  BUILD_DIRS+=		doc
  INSTALL_TARGET+=	install_doc

  include ../../mk/sysdep/pdflatex.mk
  include ../../mk/sysdep/bibtex.mk
endef

include ../../devel/mkdep/depend.mk
include ../../mk/sysdep/bison.mk
include ../../mk/sysdep/flex.mk
include ../../mk/sysdep/motif.mk
include ../../mk/sysdep/readline.mk
include ../../mk/robotpkg.mk

post-extract:
	${CHMOD} +x ${WRKSRC}/util/install.sh
