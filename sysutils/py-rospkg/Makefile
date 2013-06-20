# robotpkg Makefile for:	sysutils/py-rospkg
# Created:			Anthony Mallet on Sun, 15 Jul 2012
#

ROS_PKG=	rospkg
ROS_VERSION=	1.0.20
PKGNAME=	${PKGTAG.python}-${ROS_PKG}-${ROS_VERSION}

CATEGORIES=	sysutils
ROS_COMMENT=	basic utilities for querying stacks information

CONFLICTS+=	py[0-9][0-9]-rospkg-${VERSION}
PYDISTUTILSPKG=	yes

include ../../meta-pkgs/ros-base/Makefile.common

# tests during 'install' require PYTHONPATH to hold the installation path
MAKE_ENV+=		PYTHONPATH=$(call quote,${PREFIX}/${PYTHON_SITELIB})

SUBST_CLASSES+=		py-distsetup
SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	scripts/rosversion

# Fix prefix
SUBST_CLASSES+=		ros-prefix
SUBST_STAGE.ros-prefix=	pre-configure
SUBST_MESSAGE.ros-prefix=Fixing harcoded prefix in scripts
SUBST_FILES.ros-prefix=	src/rospkg/environment.py
SUBST_SED.ros-prefix=\
  -e "s@'/etc/ros'@'${PREFIX}/etc/ros'@"

include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
