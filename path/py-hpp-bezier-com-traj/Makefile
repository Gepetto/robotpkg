# robotpkg Makefile for:	path/py39-hpp-bezier-com-traj
# Created:			Guilhem Saurel on Tue, 13 Apr 2021
#

PKGREVISION=		1
HPP_PACKAGE=		hpp-bezier-com-traj
HPP_COMMENT=		trajectory generation for the COM with bezier curves

CATEGORIES=		path

USE_BOOST_LIBS=		python
PYTHON_NOTAG_CONFLICT=	yes

include ../../meta-pkgs/hpp/Makefile.common

include ../../math/eigen3/depend.mk
include ../../path/coal/depend.mk
include ../../math/pinocchio/depend.mk
include ../../math/ndcurves/depend.mk
include ../../math/py-eigenpy/depend.mk
include ../../path/py-coal/depend.mk
include ../../math/py-pinocchio/depend.mk
include ../../math/py-ndcurves/depend.mk
include ../../path/py-hpp-centroidal-dynamics/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
