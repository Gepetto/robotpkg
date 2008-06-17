# $LAAS: Makefile 2008/06/17 14:53:36 mallet $
#
# Copyright (c) 2008 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice  and this list of  conditions in the documentation   and/or
#      other materials provided with the distribution.
#
#                                       Anthony Mallet on Wed May 14 2008
#

DISTNAME=	gik-genom-1.1

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=gik-genom/}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	Generalized Inverse Kinematics for humanoid robots - GenoM component

GNU_CONFIGURE=	yes

DEPENDS+=	netshring>=1.0:../../architecture/netshring
DEPENDS+=	hrp2-dynamics>=1.0:../../math/hrp2-dynamics

GENOM_MODULE=	gik
include ../../architecture/genom/depend.mk

include ../../path/hpp-gik/depend.mk
include ../../robots/hrp2-14/depend.mk
include ../../architecture/genom-openhrp-plugin/depend.mk
include ../../mk/robotpkg.mk
