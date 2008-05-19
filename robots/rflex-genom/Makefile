# $NetBSD$
#

DISTNAME=		rflex-genom-0.2
CATEGORIES=		robots
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for rFlex management.

GNU_CONFIGURE=		yes
USE_PKG_CONFIG=		yes

PKG_OPTIONS_REQUIRED_GROUPS=	robot
PKG_OPTIONS_GROUP.robot=	atrv atrv-junior b21

PKG_OPTION_DESCR.atrv=	Enable support for atrv platform
PKG_OPTION_SET.atrv:=	GENOM_ARGS+= -DATRV

PKG_OPTION_DESCR.atrv-junior=	Enable support for atrv-junior platform
PKG_OPTION_SET.atrv-junior:=	GENOM_ARGS+= -DATRV_JUNIOR

PKG_OPTION_DESCR.b21=	Enable support for b21 platform
PKG_OPTION_SET.b21:=	GENOM_ARGS+= -DB21

GENOM_MODULE=		rflex
include ../../architecture/genom/depend.mk

include ../../architecture/genPos-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../robots/rflexclients/depend.mk
include ../../mk/robotpkg.mk
