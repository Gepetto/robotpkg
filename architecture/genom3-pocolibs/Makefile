# robotpkg Makefile for:	architecture/genom3-pocolibs
# Created:			Anthony Mallet on Mon, 9 Nov 2015
#

DISTNAME=	genom3-pocolibs-1.16
CATEGORIES=	architecture
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=genom3-pocolibs/}
MASTER_REPOSITORY= ${MASTER_REPOSITORY_OPENROBOTS}genom3/genom3-pocolibs

MAINTAINER=	mallet@laas.fr
HOMEPAGE=	https://git.openrobots.org/projects/genom3-pocolibs
COMMENT=	GenoM3 template for pocolibs-based components

LICENSE=	2-clause-bsd

GNU_CONFIGURE=	yes

DEPEND_ABI.pocolibs=	pocolibs>=2.12

include ../../middleware/pocolibs/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../architecture/genom3/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
