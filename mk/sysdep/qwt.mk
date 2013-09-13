# robotpkg sysdep/qwt.mk
# Created:			Anthony Mallet on Thu Sep 12, 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
QWT_DEPEND_MK:=		${QWT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qwt
endif

ifeq (+,$(QWT_DEPEND_MK)) # ------------------------------------------------

PREFER.qwt?=		system

DEPEND_USE+=		qwt
DEPEND_ABI.qwt?=	qwt>=5

SYSTEM_SEARCH.qwt=\
  'include/{,qwt{,-qt[0-9]}/}qwt_global.h:/QWT_VERSION_STR/s/[^0-9.]//gp' \
  'lib/libqwt{,-qt[0-9]}.so{.[0-9]*,}:s/.*[.]so[.]*//p:$${ECHO} %'

SYSTEM_PKG.Debian.qwt=	libqwt-dev
SYSTEM_PKG.Fedora.qwt=	qwt-devel
SYSTEM_PKG.NetBSD.qwt=	x11/qwt-qt4

include ../../mk/sysdep/qt4-libs.mk

endif # QWT_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:= ${DEPEND_DEPTH:+=}
