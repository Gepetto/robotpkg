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
DEPEND_ABI.qwt?=	qwt>=6

SYSTEM_SEARCH.qwt=\
  include/qwt/qwt.h\
  lib/libqwt.so\

SYSTEM_PKG.Fedora.qwt=qwt
SYSTEM_PKG.Ubuntu.qwt=libqwt-dev
SYSTEM_PKG.Debian.qwt=libqwt-dev
SYSTEM_PKG.NetBSD.qwt=x11/qwt


endif # QWT_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:= ${DEPEND_DEPTH:+=}
