# robotpkg Makefile for:	robots/tk3-matlab
# Created:			Anthony Mallet on Mon, 6 Jul 2015
#

DISTNAME=	tk3-matlab-1.5.1
CATEGORIES=	robots
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=tk3-matlab/}
MASTER_REPOSITORY= ${MASTER_REPOSITORY_OPENROBOTS}telekyb3/tk3-matlab

MAINTAINER=	mallet@laas.fr
HOMEPAGE=	https://git.openrobots.org/projects/tk3-matlab
COMMENT=	matlab/simulink interface for controlling tk3-mikrokopter

LICENSE=	2-clause-bsd

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=MATLAB=${PREFIX.matlab}

include ../../mk/sysdep/matlab.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
