# robotpkg Makefile for:	localization/MTI-genom
# Created:			Arnaud Degroote on Thu, 17 Jul 2008
#

DISTNAME=		MTI-genom-0.4
PKGREVISION=		1
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}MTI-genom

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		GenoM module for MTI management

#GNU_CONFIGURE=		yes

GENOM_MODULE=		MTI
include ../../architecture/genom/depend.mk

include ../../interfaces/genBasic-genom/depend.mk
include ../../hardware/MTI/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
