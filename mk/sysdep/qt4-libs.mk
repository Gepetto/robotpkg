# robotpkg sysdep/qt4-libs
# Created: Michael Reckhaus on 07 Oct 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
QT4_LIBS_DEPEND_MK:=	${QT4_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qt4-libs
endif

ifeq (+,$(QT4_LIBS_DEPEND_MK)) # -------------------------------------------

PREFER.qt4-libs?=	system

DEPEND_USE+=		qt4-libs
DEPEND_ABI.qt4-libs?=	qt4-libs>=4.6.2

SYSTEM_SEARCH.qt4-libs=\
  '{,qt[0-9]/}include/{,qt4/{,include/}}Qt{,Core}/qcoreevent.h'		\
  '{lib,share/qt[0-9]/lib,qt[0-9]/lib,lib/qt[0-9]}/libQtCore.{so,a}'	\
  'lib/pkgconfig/QtCore.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.qt4-libs=	qt-devel
SYSTEM_PKG.Debian.qt4-libs=	libqt4-dev
SYSTEM_PKG.NetBSD.qt4-libs=	x11/qt4-libs x11/qt4-tools
SYSTEM_PKG.Gentoo.qt4-libs=	x11-libs/qt-meta

endif # QT4_LIBS_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:= ${DEPEND_DEPTH:+=}
