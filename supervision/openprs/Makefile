# robotpkg Makefile for:	supervision/openprs
# Created:			Anthony Mallet on Wed, 17 Oct 2007
#

DISTNAME=		openprs-1.0b14
CATEGORIES=		supervision
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=openprs/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}openprs

MAINTAINER=		felix@laas.fr
HOMEPAGE=		https://softs.laas.fr/openrobots/wiki/openprs
COMMENT=		Open Source Procedural Reasoning System
LICENSE=		2-clause-bsd

MAKE_JOBS_SAFE=		no
NOT_FOR_PLATFORM=

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

  USE_TEX_PKGS+=	graphicx.sty index.sty hyperref.sty verbatim.sty

  include ../../mk/sysdep/pdflatex.mk
  include ../../mk/sysdep/bibtex.mk
  include ../../mk/sysdep/tex-pkg.mk
endef

include ../../devel/mkdep/depend.mk
include ../../mk/sysdep/bison.mk
include ../../mk/sysdep/flex.mk
include ../../mk/sysdep/motif.mk
include ../../mk/sysdep/readline.mk
include ../../mk/robotpkg.mk

post-extract:
	${CHMOD} +x ${WRKSRC}/util/install.sh
