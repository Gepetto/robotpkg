# $LAAS: Makefile 2010/21/04 15:59:08 tmoulard $
#
# Copyright (c) 2010 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
#                                      Thomas Moulard on Wed Apr 21 2010
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
