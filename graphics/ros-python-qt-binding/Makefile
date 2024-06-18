# robotpkg Makefile for:	middleware/ros-comm
# Created:			Anthony Mallet on Tue,  9 Oct 2012
#

ROS_PKG=	python_qt_binding
ROS_VERSION=	0.3.6
ROS_REPO=	ros-visualization

CATEGORIES=	graphics
ROS_COMMENT=	python bindings for Qt

include ../../meta-pkgs/ros-base/Makefile.common

USE_QMAKE=	no


# Configure path to programs
SUBST_CLASSES+=		sip-path
SUBST_STAGE.sip-path=	pre-configure
SUBST_MESSAGE.sip-path=	Configuring sip path
SUBST_SED.sip-path+=	-e 's|@SIP@|${SIP}|'
SUBST_SED.sip-path+=	-e 's|@MAKE@|${_gmake_path}|'
SUBST_SED.sip-path+=	-e 's|@QMAKE@|${QMAKE}|'
SUBST_SED.sip-path+=	-e 's|@PYQT5_SIP_DIR@|${PYQT5_SIP_DIR}|'
SUBST_FILES.sip-path+=	cmake/sip_helper.cmake
SUBST_FILES.sip-path+=	cmake/sip_configure.py

_gmake_path=\
  $(word 1, $(realpath ${MAKE} $(addsuffix /${MAKE},$(subst :, ,${PATH}))))

PYQT5_SIP_DIR=\
  $(realpath $(dir $(word 1,$(filter %.sip,${SYSTEM_FILES.py-qt5})))/..)

# Replace python interpreter in source files
SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	src/python_qt_binding/*.py

# for version 3 package.xml
DEPEND_ABI.py-catkin-pkg = ${PKGTAG.python}-catkin-pkg>=0.4

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../mk/sysdep/py-qt5.mk
include ../../mk/sysdep/py-sip.mk
include ../../mk/sysdep/qmake.mk
include ../../mk/sysdep/qt5-qtbase.mk
include ../../mk/robotpkg.mk
