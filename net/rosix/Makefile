# robotpkg Makefile for:	net/rosix
# Created:			Anthony Mallet on Mon, 22 Jun 2015
#

DISTNAME=	rosix-1.2
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=rosix/}
MASTER_REPOSITORY= ${MASTER_REPOSITORY_OPENROBOTS}genomix/rosix

MAINTAINER=	mallet@laas.fr
HOMEPAGE=	http://git.openrobots.org/projects/rosix
COMMENT=	HTTP server for controlling ros nodes

LICENSE=	2-clause-bsd

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=PYTHON_SITELIB=$(PYTHON_SITELIB)

include ../../lang/ros-genpy/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../middleware/ros-actionlib/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
