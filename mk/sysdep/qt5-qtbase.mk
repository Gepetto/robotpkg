# robotpkg sysdep/qt5-qtbase
# Created: Anthony Mallet on Mon, 10 Sep 2018
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
QT5_QTBASE_DEPEND_MK:=	${QT5_QTBASE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qt5-qtbase
endif

ifeq (+,$(QT5_QTBASE_DEPEND_MK)) # -----------------------------------------

PREFER.qt5-qtbase?=	$(or ${PREFER.qt},system)

DEPEND_USE+=		qt5-qtbase
DEPEND_ABI.qt5-qtbase?=	qt5-qtbase>=5<6

SYSTEM_SEARCH.qt5-qtbase=\
  'include/{,qt{,5}/}QtCore/qtcoreversion.h:/VERSION_STR/s/[^0-9.]//gp' \
  'lib/libQt5Core.so'						    \
  'lib/pkgconfig/Qt5Core.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PREFIX.qt5-qtbase?=	${SYSTEM_PREFIX:=/qt5} ${SYSTEM_PREFIX}

SYSTEM_PKG.Fedora.qt5-qtbase=	qt5-devel
SYSTEM_PKG.Debian.qt5-qtbase=	qtbase5-dev
SYSTEM_PKG.NetBSD.qt5-qtbase=	x11/qt5-qtbase

# this is required for cmake to locate the Config.cmake files
CMAKE_PREFIX_PATH+=${PREFIX.qt5-qtbase}

# define Qt version for qmake et al.
export QT_SELECT=	5

endif # QT5_QTBASE_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:= ${DEPEND_DEPTH:+=}
