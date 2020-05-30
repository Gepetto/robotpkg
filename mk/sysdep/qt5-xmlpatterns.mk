# robotpkg sysdep/qt5-xmlpatterns
# Created: Anthony Mallet on 04 Jun 2019
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
QT5_XMLPATTERNS_DEPEND_MK:=	${QT5_XMLPATTERNS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qt5-xmlpatterns
endif

ifeq (+,$(QT5_XMLPATTERNS_DEPEND_MK)) # ------------------------------------

PREFER.qt5-xmlpatterns?=	system

DEPEND_USE+=			qt5-xmlpatterns
DEPEND_ABI.qt5-xmlpatterns?=	qt5-xmlpatterns>=5.0.0

SYSTEM_SEARCH.qt5-xmlpatterns=\
  '{,qt5/}include/{,qt{,5}/{,include/}}Qt{,XmlPatterns}/QtXmlPatternsVersion'	\
  '{lib,share/qt5/lib,qt5/lib,lib/qt5}/libQt5XmlPatterns.{so,a}'		\
  '{,lib}/cmake/Qt5XmlPatterns/Qt5XmlPatternsConfig.cmake'			\
  'lib/pkgconfig/Qt5XmlPatterns.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Arch.qt5-xmlpatterns=	qt5-xmlpatterns
SYSTEM_PKG.Debian.qt5-xmlpatterns=	libqt5xmlpatterns5-dev
SYSTEM_PKG.Fedora.qt5-xmlpatterns=	qt5-qtxmlpatterns-devel
SYSTEM_PKG.NetBSD.qt5-xmlpatterns=	x11/qt5-qtxmlpatterns

endif # QT5_XMLPATTERNS_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:= ${DEPEND_DEPTH:+=}
