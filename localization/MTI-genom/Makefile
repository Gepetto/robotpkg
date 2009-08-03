# $LAAS: Makefile 2008/06/17 18:02:03 mallet $
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
#                                      Arnaud Degroote on Thue July 17 2008
#

DISTNAME=		MTI-genom-0.2
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/MTI-genom

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for MTI management

GNU_CONFIGURE=		yes

GENOM_MODULE=		MTI
include ../../architecture/genom/depend.mk

include ../../architecture/genBasic-genom/depend.mk
include ../../hardware/MTI/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mk/robotpkg.mk
