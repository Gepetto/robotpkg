# robotpkg sysdep/qt5-declarative
# Created: Arnaud Degroote on 02 Dec 2015
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
QT5_DECLARATIVE_DEPEND_MK:=	${QT5_DECLARATIVE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qt5-declarative
endif

ifeq (+,$(QT5_DECLARATIVE_DEPEND_MK)) # -------------------------------------------

PREFER.qt5-declarative?=	system

DEPEND_USE+=		qt5-declarative
DEPEND_ABI.qt5-declarative?=	qt5-declarative>=5.0.0

SYSTEM_SEARCH.qt5-declarative=\
  '{,qt5/}include/{,qt5/{,include/}}Qt{,Qml}/qqml.h'		\
  '{lib,share/qt5/lib,qt5/lib,lib/qt5}/libQt5Qml.{so,a}'	\
  'lib/pkgconfig/Qt5Qml.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.qt5-declarative=	qtdeclarative5-dev
SYSTEM_PKG.NetBSD.qt5-declarative=	x11/qt5-qtdeclarative 

endif # QT5_DECLARATIVE_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:= ${DEPEND_DEPTH:+=}
