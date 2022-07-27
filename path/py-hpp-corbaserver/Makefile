# robotpkg Makefile for:	path/py-hpp-corbaserver
# Created:			Anthony Mallet on Mon, 27 Aug 2007
#

HPP_PACKAGE=		hpp-corbaserver
HPP_COMMENT=		Corba server for Humanoid Path Planner
PKGREVISION=		1

CATEGORIES=		path

MAKE_JOBS_SAFE=		no
PYTHON_NOTAG_CONFLICT=	yes

include ../../meta-pkgs/hpp/Makefile.common

include ../../math/hpp-pinocchio/depend.mk
include ../../middleware/omniORB/depend.mk
include ../../middleware/py-omniORBpy/depend.mk
include ../../middleware/hpp-template-corba/depend.mk
include ../../path/hpp-constraints/depend.mk
include ../../path/hpp-core/depend.mk
include ../../mapping/octomap/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c++.mk
include ../../mk/language/c.mk
include ../../mk/sysdep/py-numpy.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
