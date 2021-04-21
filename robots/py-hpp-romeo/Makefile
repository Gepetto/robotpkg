# robotpkg Makefile for:	robots/py39-hpp-romeo
# Created:			Guilhem Saurel on Wed, 21 Apr 2021
#

HPP_PACKAGE=		hpp-romeo
HPP_COMMENT=		Python and ros launch files for Romeo robot in hpp.

ROSNAME=		$(subst -,_,${HPP_PACKAGE})
DISTNAME=		${ROSNAME}-${HPP_VERSION}

CATEGORIES=		robots

DYNAMIC_PLIST_DIRS+=	share/doc/${ROSNAME}

PYTHON_NOTAG_CONFLICT=	yes

include ../../meta-pkgs/hpp/Makefile.common

include ../../path/py-hpp-corbaserver/depend.mk
include ../../robots/example-robot-data/depend.mk

include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
