# $LAAS: Makefile 2008/05/25 15:18:47 tho $
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
#                                      Arnaud Degroote on Tue Jun 10 2008
#

DISTNAME=		aspect-genom-0.1
CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Aspect map on the base of laser data

GNU_CONFIGURE=		yes

GENOM_MODULE=		aspect
include ../../architecture/genom/depend.mk

include ../../localization/segloc-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../robots/sick-genom/depend.mk
include ../../robots/mapkit/depend.mk
include ../../mk/robotpkg.mk
