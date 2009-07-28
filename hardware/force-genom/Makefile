# $LAAS: Makefile 2008/06/17 18:39:53 mallet $
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
#                                         Nizar Sallem on Tue Jul 28 2009
#

DISTNAME=		force-genom-1.1.1
CATEGORIES=		hardware
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=force-genom/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/force-genom


MAINTAINER=		daniel@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for data acquisition from force sensor JR3.

GNU_CONFIGURE=		yes

GENOM_MODULE=		force
include ../../architecture/genom/depend.mk
include ../../math/gbM/depend.mk

#!!!nksallem!!! It is commentend on the gen file so why not here :)
#include ../../robots/qarm/depend.mk

#!!!nksallem!!! It is commentend on the gen file so why not here :)
#include ../../robots/xarm/depend.mk

include ../../mk/robotpkg.mk
