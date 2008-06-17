# $LAAS: Makefile 2008/06/17 18:28:40 mallet $
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
#                                      Arnaud Degroote on Mon May 19 2008
#

DISTNAME=		ndd-genom-1.0
CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Dynamic obstacle avoidance module

GNU_CONFIGURE=		yes

GENOM_MODULE=		ndd
include ../../architecture/genom/depend.mk

include ../../architecture/genBasic-genom/depend.mk
include ../../architecture/genPos-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../localization/segloc-genom/depend.mk
include ../../path/aspect-genom/depend.mk
include ../../path/pilo-genom/depend.mk
include ../../robots/mapkit/depend.mk
include ../../hardware/sick-genom/depend.mk
include ../../mk/robotpkg.mk
