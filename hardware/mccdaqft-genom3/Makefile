# robotpkg Makefile for:	hardware/mccdaqft-genom3
# Created:			Anthony Mallet on Tue, 21 Aug 2018
#

DISTNAME=		mccdaqft-genom3-1.0.1
CATEGORIES=		hardware
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		GenoM3 component reading force sensor from a MCC DAQ
HOMEPAGE=		https://git.openrobots.org/projects/mccdaqft-genom3
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

DEPEND_ABI.daqflex-libs=	daqflex-libs>=1.0
DEPEND_ABI.eigen3=		eigen3>=3.1

include ../../hardware/daqflex-libs/depend.mk
include ../../interfaces/openrobots2-idl/depend.mk
include ../../math/eigen3/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
