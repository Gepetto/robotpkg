# $LAAS: Makefile 2008/06/17 14:01:55 mallet $
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
#                                       Anthony Mallet on Mon Mar 17 2008
#

DISTNAME=		hueblob-genom-1.1
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for simple object detection and localization

GNU_CONFIGURE=		yes

GENOM_MODULE=		hueblob
include ../../architecture/genom/depend.mk

include ../../image/viam-genom/depend.mk
include ../../image/stereopixel-genom/depend.mk
include ../../image/opencv/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mk/robotpkg.mk
