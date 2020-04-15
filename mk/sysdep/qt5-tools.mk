# robotpkg sysdep/qt5-tools
# Created: Anthony Mallet on 04 Jun 2019
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
QT5_TOOLS_DEPEND_MK:=	${QT5_TOOLS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qt5-tools
endif

ifeq (+,$(QT5_TOOLS_DEPEND_MK)) # ------------------------------------------

PREFER.qt5-tools?=	system

DEPEND_USE+=		qt5-tools
DEPEND_ABI.qt5-tools?=	qt5-tools>=5.0.0

SYSTEM_SEARCH.qt5-tools=\
  '{,qt5/}include/{,qt{,5}/{,include/}}Qt{,Designer}/QtDesigner'	\
  '{lib,share/qt5/lib,qt5/lib,lib/qt5}/libQt5Designer.{so,a}'		\
  '{,lib,qt5/lib}/cmake/Qt5Designer/Qt5DesignerConfig.cmake'		\
  '{,lib,qt5/lib}/cmake/Qt5LinguistTools/Qt5LinguistToolsConfig.cmake'	\
  'lib/pkgconfig/Qt5Designer.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.qt5-tools=	qttools5-dev-tools
SYSTEM_PKG.Fedora.qt5-tools=	qt5-qttools-devel
SYSTEM_PKG.NetBSD.qt5-tools=	x11/qt5-qttools

endif # QT5_TOOLS_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:= ${DEPEND_DEPTH:+=}
