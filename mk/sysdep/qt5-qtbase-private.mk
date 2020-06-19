# robotpkg sysdep/qt5-qtbase-private
# Created: Guilhem Saurel on Thu, 28 May 2020
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
QT5_QTBASE_PRIVATE_DEPEND_MK:=	${QT5_QTBASE_PRIVATE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			qt5-qtbase-private
endif

ifeq (+,$(QT5_QTBASE_PRIVATE_DEPEND_MK)) # -----------------------------------------

PREFER.qt5-qtbase-private?=	system

DEPEND_USE+=			qt5-qtbase-private
DEPEND_ABI.qt5-qtbase-private?=	qt5-qtbase-private>=5<6

SYSTEM_SEARCH.qt5-qtbase-private=\
    'include/{,qt{,5}/}QtCore/*/QtCore/private/qmetaobject_p.h:s@.*/\([.0-9][.0-9]*\)/.*@\1@p:echo %'

SYSTEM_PKG.Arch.qt5-qtbase-private=	qt5-base
SYSTEM_PKG.Debian.qt5-qtbase-private=	qtbase5-private-dev
SYSTEM_PKG.Fedora.qt5-qtbase-private=	qt5-qtbase-private-devel

endif # QT5_QTBASE_PRIVATE_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:= ${DEPEND_DEPTH:+=}
