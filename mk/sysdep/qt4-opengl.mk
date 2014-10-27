# robotpkg sysdep/qt4-opengl
# Created: Anthony Mallet on Mon 27 Oct 2014
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
QT4_OPENGL_DEPEND_MK:=	${QT4_OPENGL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qt4-opengl
endif

ifeq (+,$(QT4_OPENGL_DEPEND_MK)) # -----------------------------------------

PREFER.qt4-opengl?=	system

DEPEND_USE+=		qt4-opengl
DEPEND_ABI.qt4-opengl?=	qt4-opengl>=4.6.2

SYSTEM_SEARCH.qt4-opengl=\
  '{,qt[0-9]/}include/{,qt4/{,include/}}QtOpenGL/qgl.h'			\
  '{lib,share/qt[0-9]/lib,qt[0-9]/lib,lib/qt[0-9]}/libQtOpenGL.{so,a}'	\
  'lib/pkgconfig/QtOpenGL.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.qt4-opengl=	qt-devel
SYSTEM_PKG.Debian.qt4-opengl=	libqt4-opengl-dev
SYSTEM_PKG.NetBSD.qt4-opengl=	x11/qt4-libs
SYSTEM_PKG.Gentoo.qt4-opengl=	x11-libs/qt-meta

endif # QT4_OPENGL_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:= ${DEPEND_DEPTH:+=}
