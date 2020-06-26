# robotpkg sysdep/qt5-svg
# Created: Guilhem Saurel on Thu, 28 May 2020
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
QT5_SVG_DEPEND_MK:=	${QT5_SVG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			qt5-svg
endif

ifeq (+,$(QT5_SVG_DEPEND_MK)) # -----------------------------------------

PREFER.qt5-svg?=	system

DEPEND_USE+=			qt5-svg
DEPEND_ABI.qt5-svg?=	qt5-svg>=5<6

SYSTEM_SEARCH.qt5-svg=\
  'include/{,qt{,5}/}QtSvg/QtSvg'				\
  'lib/cmake/Qt5Svg/Qt5SvgConfig.cmake:s/)//g;/VERSION_STRING/s/.* //gp'

SYSTEM_PREFIX.qt5-svg?=		${SYSTEM_PREFIX:=/qt5} ${SYSTEM_PREFIX}

SYSTEM_PKG.Arch.qt5-svg=	qt5-svg
SYSTEM_PKG.Debian.qt5-svg=	libqt5svg5-dev
SYSTEM_PKG.NetBSD.qt5-svg=	x11/qt5-qtsvg
SYSTEM_PKG.RedHat.qt5-svg=	qt5-qtsvg-devel

endif # QT5_SVG_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:= ${DEPEND_DEPTH:+=}
