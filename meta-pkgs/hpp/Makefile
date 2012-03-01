# robotpkg Makefile for:	meta-pkgs/hpp
# Created:			Thomas Moulard on Wed, 8 Sep 2010
#

DISTNAME=	hpp-20120103

COMMENT=	Meta-package for the Humanoid Path Planner
CATEGORIES=	meta-pkgs
MAINTAINER=	hpp@laas.fr

META_PACKAGE=	yes

# Core packages.
include ../../path/hpp-core/depend.mk
include ../../devel/hpp-model/depend.mk
include ../../devel/hpp-util/depend.mk

# CORBA packages.
include ../../devel/hpp-corbaserver/depend.mk

# Algorithms.
include ../../path/hpp-walkfootplanner/depend.mk
include ../../path/hpp-walkplanner/depend.mk

include ../../mk/robotpkg.mk
