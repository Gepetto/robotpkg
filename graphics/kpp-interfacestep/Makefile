# robotpkg Makefile for:	graphics/kpp-interfacestep
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

HPP_PACKAGE=		kpp-interfacestep
HPP_VERSION=		0.2
MASTER_REPOSITORY=	git git@github.com:laas/kpp-interfacestep.git

CATEGORIES=	graphics
HPP_COMMENT=	Graphical user interface for hpp-wholebody-step-planner
LICENSE=	gnu-lgpl-v3

HPP_BUILD_SYSTEM=	cmake

include ../../meta-pkgs/hpp/Makefile.common

include ../../graphics/kpp-interface/depend.mk
include ../../path/hpp-wholebody-step-corba/depend.mk
include ../../path/hpp-wholebody-step-planner/depend.mk
include ../../mk/sysdep/glu.mk
include ../../mk/sysdep/kineoworks.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

post-install:
	${RUN}${MAKE} -C ${WRKSRC} license
