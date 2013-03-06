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
SYSTEM_SEARCH.qmake=\
	'{,qt[0-9]/}bin/qmake{,-qt[0-9]}::% -query QMAKE_VERSION'

USE_QMAKE?=		yes
export QMAKE=		$(word 1,${SYSTEM_FILES.qmake})

SYSTEM_PKG.Debian.qmake=	qt4-qmake
SYSTEM_PKG.Fedora.qmake=	qt-devel
SYSTEM_PKG.Ubuntu.qmake=	qt4-qmake

endif # QMAKE_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
