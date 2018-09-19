# robotpkg Makefile for:	sysutils/py-rospkg
# Created:			Anthony Mallet on Sun, 15 Jul 2012
#

ROS_PKG=	rospkg
ROS_VERSION=	1.1.7
PKGNAME=	${PKGTAG.python}-${ROS_PKG}-${ROS_VERSION}

CATEGORIES=	sysutils
ROS_COMMENT=	basic utilities for querying stacks information

CONFLICTS+=	py[0-9][0-9]-rospkg-${VERSION}

PYDISTUTILSPKG=	yes
PYSETUPINSTALLARGS+=	--single-version-externally-managed --root=/

include ../../meta-pkgs/ros-base/Makefile.common

# Fix prefix
SUBST_CLASSES+=		ros-prefix
SUBST_STAGE.ros-prefix=	pre-configure
SUBST_MESSAGE.ros-prefix=Fixing harcoded prefix in scripts
SUBST_FILES.ros-prefix=	src/rospkg/environment.py
SUBST_SED.ros-prefix=\
  -e "s@'/etc/ros'@'${PREFIX}/etc/ros'@"

include ../../mk/sysdep/py-setuptools.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
