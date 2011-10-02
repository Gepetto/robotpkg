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

SYSTEM_SEARCH.tdom=	\
	'lib/tcl{,tk}{,[0-9]*}/tdom[0-9]*/tdom.tcl'	\
	'lib/tcl{,tk}{,[0-9]*}/tdom[0-9]*/pkgIndex.tcl:/ifneeded/s/[^0-9.]//gp'

SYSTEM_PKG.Linux.tdom=	tdom
SYSTEM_PKG.NetBSD.tdom=	wip/tcl-tDOM

include ../../mk/sysdep/tcl.mk

endif # TDOM_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
