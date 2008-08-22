# $LAAS: Makefile 2008/08/22 11:46:33 mallet $
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
#                                       Anthony Mallet on Fri Mar 14 2008
#

DISTNAME=		viam-genom-1.3
CATEGORIES=		image
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=viam-genom/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.laas.fr/~mallet
COMMENT=		Versatile Image Acquisition Module - GenoM component

GNU_CONFIGURE=		yes

GENOM_MODULE=		viam
include ../../architecture/genom/depend.mk

include ../../image/viam-libs/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mk/robotpkg.mk
