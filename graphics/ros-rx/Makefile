# robotpkg Makefile for:	middleware/ros-rx
# Created:			Anthony Mallet on Mon, 20 Feb 2012
#

PKGVERSION=	1.6.2
MASTER_SITES=	${MASTER_SITE_ROS:=rx/tags/rx-${PKGVERSION_NOREV}}

ROS_PACKAGE=			rx
ROS_COMMENT=			GUI tools
ROS_INSTALLATION_SUBDIR=	rx
NOT_FOR_PLATFORM=

FETCH_METHOD=			svn
include ../../meta-pkgs/ros-base/Makefile.common

# Replace wx-config path
SUBST_CLASSES+=		rwx
SUBST_STAGE.rwx=	pre-configure
SUBST_MESSAGE.rwx=	Fixing wx-config path in configuration files
SUBST_FILES.rwx=	wxswig/manifest.xml
SUBST_SED.rwx=		-e 's|wx-config|${WX_CONFIG}|'

include ../../middleware/ros-comm/depend.mk
include ../../middleware/ros-core/depend.mk
include ../../mk/sysdep/py-matplotlib.mk
include ../../mk/sysdep/py-wxpython.mk
include ../../mk/sysdep/wxwidgets.mk

DEPEND_ABI.py-matplotlib+=	~gtk+wx

include ../../mk/robotpkg.mk
