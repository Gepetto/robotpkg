# $LAAS: Makefile 2009/03/16 15:27:57 mallet $
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
#                                       Anthony Mallet on Wed May 14 2008
#

DISTNAME=	walk-genom-1.4

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=walk-genom/}
MASTER_REPOSITORY=git ssh://softs.laas.fr/git/jrl/component/walk-genom

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	Walk trajectories for humanoid robots - GenoM component

GNU_CONFIGURE=	yes

DEPENDS+=	netshring>=1.0:../../architecture/netshring
DEPENDS+=	hpp-corbaserver>=1.6:../../devel/hpp-corbaserver

GENOM_MODULE=	walk
include ../../architecture/genom/depend.mk

include ../../path/hpp-walkplanner/depend.mk
include ../../architecture/genom-openhrp-plugin/depend.mk
include ../../devel/omniORB/depend.mk
include ../../robots/hrp2-14/depend.mk
include ../../mk/robotpkg.mk

# generate and install the Kineo license, but don't fail on errors.
post-install:
	cd ${WRKSRC} && ${SETENV} ${INSTALL_ENV} ${MAKE_ENV} 		\
		${MAKE_PROGRAM} ${MAKE_FLAGS} ${INSTALL_MAKE_FLAGS}	\
			license install-license || ${TRUE}
