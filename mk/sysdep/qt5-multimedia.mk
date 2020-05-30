# robotpkg sysdep/qt5-multimedia
# Created: Arnaud Degroote on 01 Dec 2015
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
QT5_MULTIMEDIA_DEPEND_MK:=	${QT5_MULTIMEDIA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qt5-multimedia
endif

ifeq (+,$(QT5_MULTIMEDIA_DEPEND_MK)) # -------------------------------------------

PREFER.qt5-multimedia?=	system

DEPEND_USE+=		qt5-multimedia
DEPEND_ABI.qt5-multimedia?=	qt5-multimedia>=5.0.0

SYSTEM_SEARCH.qt5-multimedia=\
  '{,qt5/}include/{,qt{,5}/{,include/}}Qt{,Multimedia}/qcamera.h'	\
  '{lib,share/qt5/lib,qt5/lib,lib/qt5}/libQt5Multimedia.{so,a}'		\
  'lib/pkgconfig/Qt5Multimedia.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Arch.qt5-multimedia=		qt5-multimedia
SYSTEM_PKG.Debian.qt5-multimedia=	qtmultimedia5-dev
SYSTEM_PKG.Fedora.qt5-multimedia=	qt5-qtmultimedia-devel
SYSTEM_PKG.NetBSD.qt5-multimedia=	x11/qt5-qtmultimedia

endif # QT5_MULTIMEDIA_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:= ${DEPEND_DEPTH:+=}
