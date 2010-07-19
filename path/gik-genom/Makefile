#
# Copyright (c) 2008-2010 LAAS/CNRS
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

DISTNAME=	gik-genom-1.5.1
PKGREVISION=	1

CATEGORIES=	path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=gik-genom/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/gik-genom

MAINTAINER=	openrobots@laas.fr
COMMENT=	Generalized Inverse Kinematics for humanoid robots - GenoM component
LICENSE=	2-clause-bsd

USE_LANGUAGES+=	c c++

GENOM_MODULE=	gik
define PKG_OPTIONS_UNSET.api
  include ../../math/hrp2-dynamics/depend.mk
  include ../../path/hpp-gik/depend.mk
  include ../../robots/hrp2-14/depend.mk
  include ../../architecture/netshring/depend.mk
endef

include ../../architecture/genom/depend.mk
include ../../robots/hrp2-genom/depend.mk
include ../../mk/robotpkg.mk
