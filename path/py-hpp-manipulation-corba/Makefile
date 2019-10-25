# robotpkg Makefile for:	path/hpp-manipulation-corba
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

HPP_PACKAGE=		hpp-manipulation-corba

CATEGORIES=		path
HPP_COMMENT=		CORBA interface for hpp-manipulation

# omniorb has some issue with parallelism. Error message omniidl: Cannot rename
# "foo/new__init__.py" to "foo/__init__.py"
MAKE_JOBS_SAFE=		no

# boost-1.47.0 has -Wconversion warnings in date_time/posix_time/posix_time.hpp
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

USE_PYTHON=		true
PYTHON_NOTAG_CONFLICT=	yes

include ../../meta-pkgs/hpp/Makefile.common
include ../../middleware/omniORB/depend.mk
include ../../middleware/py-omniORBpy/depend.mk
include ../../mapping/octomap/depend.mk
include ../../optimization/roboptim-trajectory/depend.mk
include ../../path/py-hpp-corbaserver/depend.mk
include ../../path/hpp-manipulation-urdf/depend.mk
include ../../path/hpp-manipulation/depend.mk
include ../../path/hpp-util/depend.mk

include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
