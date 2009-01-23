# $LAAS: Makefile 2009/01/20 18:36:50 mallet $
#
# Copyright (c) 2008-2009 LAAS/CNRS
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
#                                       Anthony Mallet on Wed Mar 19 2008
#

DISTNAME=	hrp2-genom-0.4

CATEGORIES=		robots
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=hrp2-genom/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}hrp2-genom

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	Basic HRP-2 hardware control - GenoM component

GNU_CONFIGURE=	yes

DEPENDS+=	netshring>=1.0:../../architecture/netshring

CONFIGURE_ARGS+=	--with-openhrp=${PREFIX.OpenHRP}

GENOM_MODULE=	hrp2
include ../../architecture/genom/depend.mk

include ../../architecture/openhrp/depend.mk
include ../../architecture/genom-openhrp-plugin/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../math/t3d/depend.mk
include ../../devel/omniORB/depend.mk
include ../../mk/robotpkg.mk
