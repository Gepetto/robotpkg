# robotpkg Makefile for:	supervision/openprs
# Created:			Anthony Mallet on Wed, 17 Oct 2007

DISTNAME=		openprs-1.1b9
CATEGORIES=		supervision
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=openprs/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}openprs

MAINTAINER=		felix@laas.fr
HOMEPAGE=		http://www.openrobots.org/wiki/openprs
COMMENT=		Open Source Procedural Reasoning System
LICENSE=		2-clause-bsd

MAKE_JOBS_SAFE=		no
NOT_FOR_PLATFORM=

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-readline=${PREFIX.readline}
CONFIGURE_ARGS+=	--with-motif-includes=${PREFIX.motif}/include
CONFIGURE_ARGS+=	--with-motif-libraries=${PREFIX.motif}/lib
CONFIGURE_ARGS+=	LATEX='${PDFLATEX}'

USE_TEX_PKGS+=	graphicx.sty index.sty hyperref.sty verbatim.sty
USE_TEX_PKGS+=	alpha.bst

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/bibtex.mk
include ../../mk/sysdep/bison.mk
include ../../mk/sysdep/flex.mk
include ../../mk/sysdep/libX11.mk
include ../../mk/sysdep/libXt.mk
include ../../mk/sysdep/libtool-ltdl.mk
include ../../mk/sysdep/motif.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/sysdep/readline.mk
include ../../mk/sysdep/tex-pkg.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
