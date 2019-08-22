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
  'lib/libQt5Core.so'							\
  '{,lib}/cmake/Qt5Core/Qt5CoreConfig.cmake'				\
  'lib/pkgconfig/Qt5Core.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PREFIX.qt5-qtbase?=	${SYSTEM_PREFIX:=/qt5} ${SYSTEM_PREFIX}

SYSTEM_PKG.Arch.qt5-qtbase=	qt5-base
SYSTEM_PKG.RedHat.qt5-qtbase=	qt5-qtbase-devel
SYSTEM_PKG.Debian.qt5-qtbase=	qtbase5-dev
SYSTEM_PKG.NetBSD.qt5-qtbase=	x11/qt5-qtbase

# this is required for cmake to locate the Config.cmake files
CMAKE_PREFIX_PATH.qt5-qtbase=	${PREFIX.qt5-qtbase}

# define Qt version for qmake et al.
export QT_SELECT=	5

# USE_QT5_COMPONENTS selection
USE_QT5_COMPONENTS?=
override define _use_qt5_components
  ifneq (,$(filter-out core,$1))
    PREFER.qt5-$1?=	$${PREFER.qt5-qtbase}
    DEPEND_ABI.qt5-$1?=	$$(subst qt5-qtbase,qt5-$1,$${DEPEND_ABI.qt5-qtbase})
    include ../../mk/sysdep/qt5-$1.mk
  endif
endef

# Qt wants C++11
include ../../mk/language/c++11.mk

endif # QT5_QTBASE_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:= ${DEPEND_DEPTH:+=}

# apply USE_QT5_COMPONENTS
$(foreach _,${USE_QT5_COMPONENTS},$(eval $(call _use_qt5_components,$_)))
