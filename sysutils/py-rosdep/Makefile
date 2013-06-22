# robotpkg Makefile for:	sysutils/py27-rosdep
# Created:			Anthony Mallet on Sat, 22 Jun 2013
#

ROS_PKG=	rosdep
ROS_VERSION=	0.10.19
PKGNAME=	${PKGTAG.python}-${ROS_PKG}-${ROS_VERSION}

CATEGORIES=	sysutils
ROS_COMMENT=	system dependencies download and installation

CONFLICTS+=	py[0-9][0-9]-rosdep-${VERSION}
PYDISTUTILSPKG=	yes

include ../../meta-pkgs/ros-base/Makefile.common

# Fix etc prefix
SUBST_CLASSES+=			ros-prefix
SUBST_STAGE.ros-prefix=		pre-configure
SUBST_MESSAGE.ros-prefix=	Fixing harcoded prefix in scripts
SUBST_FILES.ros-prefix=		src/rosdep2/sources_list.py
SUBST_FILES.ros-prefix+=	src/rosdep2/main.py
SUBST_SED.ros-prefix=		-e "s!@PREFIX@!${PREFIX}!g"

# Replace python interpreter in source files
SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	scripts/rosdep*
SUBST_FILES.py-interp+=	src/rosdep2/main.py src/rosdep2/platforms/*.py

include ../../pkgtools/install-sh/depend.mk
include ../../sysutils/py-catkin-pkg/depend.mk
include ../../sysutils/py-rosdistro/depend.mk
include ../../sysutils/py-rospkg/depend.mk
include ../../mk/sysdep/py-yaml.mk
include ../../mk/sysdep/py-nose.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
