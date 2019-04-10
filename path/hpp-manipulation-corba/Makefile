# robotpkg Makefile for:	path/hpp-manipulation-corba
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

HPP_PACKAGE=		hpp-manipulation-corba

CATEGORIES=		path
HPP_COMMENT=		CORBA interface for hpp-manipulation

include ../../meta-pkgs/hpp/Makefile.common

# omniorb has some issue with parallelism. Error message omniidl: Cannot rename
# "foo/new__init__.py" to "foo/__init__.py"
MAKE_JOBS_SAFE=		no

# boost-1.47.0 has -Wconversion warnings in date_time/posix_time/posix_time.hpp
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

include ../../middleware/omniORB/depend.mk
include ../../middleware/omniORBpy/depend.mk
include ../../mapping/octomap/depend.mk
include ../../optimization/roboptim-trajectory/depend.mk
include ../../path/hpp-corbaserver/depend.mk
include ../../path/hpp-manipulation-urdf/depend.mk
include ../../path/hpp-manipulation/depend.mk
include ../../path/hpp-util/depend.mk

include ../../mk/language/c.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
