# robotpkg sysdep/bwidget.mk
# Created:			Matthieu Herrb on Tue, 14 Apr 2009
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BWIDGET_DEPEND_MK:=	${BWIDGET_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		bwidget
endif

ifeq (+,$(BWIDGET_DEPEND_MK)) # -------------------------------------------

PREFER.bwidget?=	system
DEPEND_USE+=		bwidget

DEPEND_ABI.bwidget?=	bwidget>=1.8

_syslib.bwidget=\
  {lib,share}/{,tcl{,[0-9.]*},tcltk{,[0-9]*}}/[bB][wW]idget{,[-0-9]*}
_vregex.bwidget=\
  /ifneeded/{s/.*ifneeded [bB][wW]idget[ \t]*//;s/[ \t].*$$//;p;q;}

SYSTEM_SEARCH.bwidget=	\
	'${_syslib.bwidget}/pkgIndex.tcl:${_vregex.bwidget}'

SYSTEM_PKG.Debian.bwidget=bwidget
SYSTEM_PKG.Fedora.bwidget=bwidget
SYSTEM_PKG.NetBSD.bwidget=x11/tk-BWidget
SYSTEM_PKG.Ubuntu.bwidget=bwidget

endif # BWIDGET_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
