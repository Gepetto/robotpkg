#
# Copyright (c) 2009 LAAS/CNRS
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
#                                     Florent Lamiraux on Wed Oct 30 2009
#

DISTNAME=	robotbuilder-${PKGVERSION}
PKGNAME=	hrp2-builder-${PKGVERSION}
PKGVERSION=	1.0.6
PKGREVISION=

CATEGORIES=		robots
MASTER_SITES=		${MASTER_SITE_JRL}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}algo/robotbuilder

MAINTAINER=	hpp-source@laas.fr
#HOMEPAGE=
COMMENT=	Function that builds an instance of HRP2.
LICENSE=	openhrp-grx-license

RESTRICTED=	Redistribution not permitted
NO_PUBLIC_SRC=	${RESTRICTED}
NO_PUBLIC_BIN=	${RESTRICTED}

USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/robotbuilder

GNU_CONFIGURE=	yes

include ../../robots/hrp2-14/depend.mk
include ../../devel/hpp-model/depend.mk
include ../../math/hrp2-dynamics/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
