# robotpkg Makefile for:	manipulation/xarm-genom
# Created:			Anthony Mallet on Tue, 28 Jul 2009
#

DISTNAME=	xarm-genom-1.4
CATEGORIES=	manipulation
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=xarm/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/xarm-genom

MAINTAINER=	xbroquer@laas.fr
COMMENT=	Controls a 6DOF arm in cartesian space.
LICENSE=	2-clause-bsd

GENOM_MODULE=	xarm

include ../../architecture/genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../math/gbM/depend.mk
include ../../robots/qarm-genom/depend.mk
include ../../mk/robotpkg.mk
