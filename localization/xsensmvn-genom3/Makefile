# robotpkg Makefile for:	localization/xsensmvn-genom3
# Created:			Anthony Mallet on Tue, 23 Nov 2021
#

DISTNAME=		xsensmvn-genom3-1.0
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}xsensmvn-genom3

MAINTAINER=		openrobots@laas.fr
COMMENT=		Export motion capture data from XSens MVN software
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

include ../../pkgtools/pkg-config/depend.mk
include ../../interfaces/openrobots2-idl/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
