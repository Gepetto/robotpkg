# $LAAS: Makefile 2007/10/17 17:48:58 mallet $

DISTNAME=		openprs-1.0b2
CATEGORIES=		architecture
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=openprs/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		https://softs.laas.fr/openrobots/wiki/openprs
COMMENT=		Open Source Procedural Reasoning System

GNU_CONFIGURE=		yes

ifneq (,MOTIFDIR)
CONFIGURE_ARGS+=	--with-motif-includes=$(MOTIFDIR)/include
CONFIGURE_ARGS+=	--with-motif-libraries=$(MOTIFDIR)/lib
endif

DEPENDS+=		mkdep>=2.7:../../devel/mkdep

include ../../mk/robotpkg.mk
