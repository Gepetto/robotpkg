# robotpkg Makefile for:	path/ndd-genom
# Created:			Arnaud Degroote on Tue, 10 Jun 2008
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

include ../../interfaces/genBasic-genom/depend.mk
include ../../interfaces/genPos-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../localization/segloc-genom/depend.mk
include ../../path/aspect-genom/depend.mk
include ../../motion/pilo-genom/depend.mk
include ../../mapping/mapkit/depend.mk
include ../../hardware/sick-genom/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
