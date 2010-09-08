# robotpkg Makefile for:	meta-pkgs/hpp
# Created:			Thomas Moulard on Wed, 8 Sep 2010
#

HPP_PACKAGE=	hpp
VERSION=	0.1
COMMENT=	Meta-package for the Humanoid Path Planner.

CATEGORIES=	meta-pkgs
META_PACKAGE=	yes

include Makefile.common

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
