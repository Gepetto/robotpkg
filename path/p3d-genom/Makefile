# robotpkg Makefile for:	path/p3d-genom
# Created:			Arnaud Degroote on Mon, 19 May 2008
#

DISTNAME=		p3d-genom-1.1
CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Local path planning - GenoM component

GNU_CONFIGURE=		yes

GENOM_MODULE=		p3d
include ../../architecture/genom/depend.mk

include ../../architecture/genBasic-genom/depend.mk
include ../../architecture/genPos-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../math/t3d/depend.mk
include ../../path/libp3d/depend.mk
include ../../mapping/dtm-genom/depend.mk
include ../../robots/rflex-genom/depend.mk
include ../../mk/robotpkg.mk
