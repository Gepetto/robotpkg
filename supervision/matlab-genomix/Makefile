# robotpkg Makefile for:	supervision/matlab-genomix
# Created:			Anthony Mallet on Tue, 16 Jun 2015
#

DISTNAME=	matlab-genomix-1.7.2
CATEGORIES=	supervision
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=matlab-genomix/}
MASTER_REPOSITORY= ${MASTER_REPOSITORY_OPENROBOTS}genomix/matlab-genomix

MAINTAINER=	mallet@laas.fr
HOMEPAGE=	https://git.openrobots.org/projects/matlab-genomix
COMMENT=	matlab client for controlling GenoM3 components with genomix

LICENSE=	2-clause-bsd

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=MATLAB=${PREFIX.matlab}

include ../../mk/sysdep/matlab.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
