# robotpkg Makefile for:	robots/py39-hpp-baxter
# Created:			Guilhem Saurel on Tue, 13 Apr 2021
#

HPP_PACKAGE=		hpp-baxter
HPP_COMMENT=		Wrappers for Baxter robot in HPP

ROSNAME=		$(subst -,_,${HPP_PACKAGE})

CATEGORIES=		robots

DYNAMIC_PLIST_DIRS+=	share/doc/${ROSNAME}

PYTHON_NOTAG_CONFLICT=	yes

include ../../meta-pkgs/hpp/Makefile.common

include ../../robots/example-robot-data/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
