# robotpkg Makefile for:	hardware/sahand-genom
# Created:			Matthieu Herrb on Wed, 21 Jan 2009
#

DISTNAME=	sahand-genom-1.1
CATEGORIES=	hardware
COMMENT=	Schunk Antropomorphic Hand control module - Genom componenent
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=sahand-genom/}
MASTER_REPOSITORY=      ${MASTER_REPOSITORY_OPENROBOTS}sahand-genom

MAINTAINER=     openrobots@laas.fr

GNU_CONFIGURE=	yes
USE_LANGUAGES=	c c++

GENOM_MODULE=	sahand

include ../../hardware/sahand-libs/depend.mk
include ../../math/gbM/depend.mk

include ../../devel/mkdep/depend.mk
include ../../architecture/genom/depend.mk
include ../../manipulation/genBasic-genom/depend.mk
include ../../manipulation/genManip-genom/depend.mk
include ../../mk/robotpkg.mk
