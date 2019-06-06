# robotpkg sysdep/qmake.mk
# Created:			Anthony Mallet on Mon Mar 23 2009
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
QMAKE_DEPEND_MK:=	${QMAKE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qmake
endif

ifeq (+,$(QMAKE_DEPEND_MK)) # ----------------------------------------------

PREFER.qmake?=		system

DEPEND_USE+=		qmake
DEPEND_ABI.qmake?=	qmake>=1
DEPEND_METHOD.qmake+=	build

_qmake.search={,qt[0-9]/}bin/qmake{,-qt[0-9]}
_qmake.pat=\
  $(if $(filter qt5-qtbase,${DEPEND_USE}),			\
    /QT/{/QT_VERSION.5[.]/!{s/.*/0/p;q}};)			\
  $(if $(filter qt4-libs,${DEPEND_USE}),			\
    /QT/{/QT_VERSION.4[.]/!{s/.*/0/p;q}};)			\
  /QMAKE_VERSION./s///p

SYSTEM_SEARCH.qmake=\
  '${_qmake.search}:${_qmake.pat}:% -query QT_VERSION QMAKE_VERSION'

USE_QMAKE?=		yes
export QMAKE=		$(word 1,${SYSTEM_FILES.qmake})

SYSTEM_PKG.Debian.qmake=	qt[45]-qmake
SYSTEM_PKG.RedHat.qmake=\
  qt$(if $(filter qt5-qtbase,${DEPEND_USE}),5-qtbase)-devel


endif # QMAKE_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
