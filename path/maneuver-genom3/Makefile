# robotpkg Makefile for:	path/maneuver-genom3
# Created:			Anthony Mallet on Tue, 13 Dec 2016
#

PKGREVISION=		1
DISTNAME=		maneuver-genom3-1.2
CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}telekyb3/${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Simple maneuver planner for aerial robots
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

include ../../interfaces/openrobots-idl/depend.mk
include ../../path/libkdtp/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
