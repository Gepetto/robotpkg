# robotpkg Makefile for:	path/hpp-wholebody-step-corba
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

HPP_PACKAGE=		hpp-wholebody-step-corba

CATEGORIES=		path
HPP_COMMENT=		CORBA server and client for whole-body walk planning

include ../../meta-pkgs/hpp/Makefile.common

# omniidl rules are not jobs safe
MAKE_JOBS_SAFE=		no

include ../../middleware/omniORB/depend.mk
include ../../middleware/omniORBpy/depend.mk
include ../../middleware/hpp-template-corba/depend.mk
include ../../path/hpp-corbaserver/depend.mk
include ../../path/hpp-util/depend.mk
include ../../path/hpp-wholebody-step/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
