# robotpkg Makefile for:	path/py39-hpp-rbprm-corba
# Created:			Guilhem Saurel on Thu, 22 Apr 2021
#

HPP_VERSION=		4.12.0
HPP_PACKAGE=		hpp-rbprm-corba
HPP_COMMENT=		Corba server for RB-PRM
PKGREVISION=		1

CATEGORIES=		path

DEPEND_ABI.octomap=	octomap>=1.8.0

MAKE_JOBS_SAFE=	no # because multiple parallel omniidl won't work

CONFIGURE_DIRS=		build
CMAKE_ARG_PATH=		..

PYTHON_NOTAG_CONFLICT=	yes

include ../../meta-pkgs/hpp/Makefile.common

include ../../path/py-hpp-rbprm/depend.mk
include ../../path/py-hpp-affordance-corba/depend.mk

include ../../graphics/py-qt-hpp-gepetto-viewer/depend.mk
include ../../mapping/octomap/depend.mk
include ../../math/eigen3/depend.mk
include ../../path/hpp-core/depend.mk
include ../../path/py-hpp-corbaserver/depend.mk
include ../../path/hpp-util/depend.mk
include ../../simulation/hpp-environments/depend.mk
include ../../simulation/py-hpp-environments/depend.mk
include ../../robots/example-robot-data/depend.mk
include ../../robots/py-example-robot-data/depend.mk
include ../../robots/py-solo-rbprm/depend.mk
include ../../robots/py-talos-rbprm/depend.mk
include ../../robots/py-hyq-rbprm/depend.mk

include ../../middleware/omniORB/depend.mk
include ../../middleware/py-omniORBpy/depend.mk

include ../../devel/boost-headers/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/build
