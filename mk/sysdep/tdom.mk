# robotpkg sysdep/tdom.mk
# Created:			Anthony Mallet on Wed, 25 Aug 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TDOM_DEPEND_MK:=	${TDOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tdom
endif

ifeq (+,$(TDOM_DEPEND_MK)) # -----------------------------------------------

PREFER.tdom?=		system

DEPEND_USE+=		tdom
DEPEND_ABI.tdom?=	tdom>=0.8

_libdir.tdom=lib{,/tcl{,tk}{,[0-9]*}}{,/${DEB_HOST_MULTIARCH}}/tdom[0-9]*
_vregex.tdom=/ifneeded/{s/.*ifneeded tdom[ \t]*//;s/[ \t].*$$//;p;q;}

SYSTEM_SEARCH.tdom=	\
	'${_libdir.tdom}/tdom.tcl'	\
	'${_libdir.tdom}/pkgIndex.tcl:${_vregex.tdom}'

SYSTEM_PKG.NetBSD.tdom=	textproc/tcl-tDOM
SYSTEM_PKG.Gentoo.tdom=	dev-tcltk/tdom
SYSTEM_PKG.Debu.tdom=	tdom-dev

include ../../mk/sysdep/tcl.mk

endif # TDOM_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
