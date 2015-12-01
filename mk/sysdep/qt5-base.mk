# robotpkg sysdep/qt5-base
# Created: Arnaud Degroote on 01 Dec 2015
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
QT5_BASE_DEPEND_MK:=	${QT5_BASE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qt5-base
endif

ifeq (+,$(QT5_BASE_DEPEND_MK)) # -------------------------------------------

PREFER.qt5-base?=	system

DEPEND_USE+=		qt5-base
DEPEND_ABI.qt5-base?=	qt5-base>=5.0.0

SYSTEM_SEARCH.qt5-base=\
  '{,qt5/}include/{,qt5/{,include/}}Qt{,Core}/qcoreevent.h'		\
  '{lib,share/qt5/lib,qt5/lib,lib/qt5}/libQt5Core.{so,a}'	\
  'lib/pkgconfig/Qt5Core.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.qt5-base=	qt5-devel
SYSTEM_PKG.Debian.qt5-base=	qtbase5-dev
SYSTEM_PKG.NetBSD.qt5-base=	x11/qt5-qtbase 

endif # QT5_BASE_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:= ${DEPEND_DEPTH:+=}
