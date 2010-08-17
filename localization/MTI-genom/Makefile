# robotpkg Makefile for:	localization/MTI-genom
# Created:			Arnaud Degroote on Thu, 17 Jul 2008
#

DISTNAME=		MTI-genom-0.4
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	git ssh://softs.laas.fr/git/robots/MTI-genom

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for MTI management

USE_LANGUAGES+=         c c++
#GNU_CONFIGURE=		yes

GENOM_MODULE=		MTI
include ../../architecture/genom/depend.mk

include ../../architecture/genBasic-genom/depend.mk
include ../../hardware/MTI/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mk/robotpkg.mk
