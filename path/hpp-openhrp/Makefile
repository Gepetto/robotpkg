# $LAAS: Makefile 2008/05/25 15:13:06 tho $
#
# Copyright (c) 2007-2008 LAAS/CNRS
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
#                                       Anthony Mallet on Mon Aug 27 2007
#

DISTNAME=	hppopenhrp-${VERSION}
PKGNAME=	hpp-openhrp-${VERSION}
VERSION=	1.2

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Basic classes used as interfaces with OpenHRP(tm).

DEPENDS+=	hpp-core>=1.3:../../path/hpp-core
DEPENDS+=	jrl-modelloader>=1.2:../../devel/jrl-modelloader
DEPENDS+=	openhrp-jrl>=20060713r6:../../architecture/openhrp-jrl

GNU_CONFIGURE=	yes

CONFIGURE_ARGS+=	--with-openhrp=${PREFIX}/OpenHRP

include ../../devel/omniORB/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
