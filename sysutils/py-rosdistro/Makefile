# robotpkg Makefile for:	sysutils/py-catkin-pkg
# Created:			Anthony Mallet on Thu, 20 Jun 2013
#

ROS_PKG=	rosdistro
ROS_VERSION=	0.2.9
PKGNAME=	${PKGTAG.python}-${ROS_PKG}-${ROS_VERSION}
MASTER_SITES=	${MASTER_SITE_GITHUB:=ros-infrastructure/${ROS_PKGURL}}

CATEGORIES=	sysutils
ROS_COMMENT=	tool for managing ROS distributions and packages

PYDISTUTILSPKG=	yes

include ../../meta-pkgs/ros-base/Makefile.common

# tests during 'install' require PYTHONPATH to hold the installation path
MAKE_ENV+=		PYTHONPATH=$(call quote,${PREFIX}/${PYTHON_SITELIB})

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	scripts/rosdistro*
SUBST_FILES.py-interp+=	src/rosdistro/external/appdirs.py

include ../../sysutils/py-catkin-pkg/depend.mk
include ../../sysutils/py-rospkg/depend.mk
include ../../mk/sysdep/py-argparse.mk
include ../../mk/sysdep/py-yaml.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
