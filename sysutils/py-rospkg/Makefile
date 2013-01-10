# robotpkg Makefile for:	sysutils/py-rospkg
# Created:			Anthony Mallet on Sun, 15 Jul 2012
#

COMMIT=			444e46f
VERSION=		1.0.16
PKGNAME=		${PKGTAG.python}-rospkg-${VERSION}
DISTNAME=		rospkg-${VERSION}
MASTER_SITES=		${MASTER_SITE_GITHUB:=ros/rospkg/tarball/${VERSION}?f=}

CATEGORIES=		sysutils
COMMENT=		ROS basic utilities for querying stacks information
HOMEPAGE=		http://ros.org/wiki/rospkg

WRKSRC=			${WRKDIR}/ros-rospkg-${COMMIT}

CONFLICTS+=		py[0-9][0-9]-rospkg-${VERSION}

PYDISTUTILSPKG=		yes

# tests during 'install' require PYTHONPATH to hold the installation path
MAKE_ENV+=\
  PYTHONPATH=$(call quote,${PYTHONPATH}:${PREFIX}/${PYTHON_SITELIB})

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-syspath py-interp
SUBST_FILES.py-syspath+=scripts/rosversion
SUBST_FILES.py-interp+=	scripts/rosversion

SUBST_CLASSES+=		py-distsetup

include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
