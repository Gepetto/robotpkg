# $LAAS: Makefile 2007/10/17 17:48:58 mallet $

PKGNAME=		openprs-1.0b1
DISTNAME=		openprs-1.0b1-src
EXTRACT_SUFX=		.tgz
CATEGORIES=		architecture
MASTER_SITES=		ftp://softs.laas.fr/pub/openrobots/openprs/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		https://softs.laas.fr/openrobots/wiki/openprs
COMMENT=		Open Source Procedural Reasoning System

GNU_CONFIGURE=		yes
WRKSRC=			${WRKDIR}/src

ifneq (,MOTIFDIR)
CONFIGURE_ARGS+=	--with-motif-includes=$(MOTIFDIR)/include
CONFIGURE_ARGS+=	--with-motif-libraries=$(MOTIFDIR)/lib
endif

DEPENDS+=		mkdep>=2.7:../../devel/mkdep

include ../../mk/robotpkg.mk
