# robotpkg sysdep/plotutils.mk
# Created:			Thomas Moulard on Mon May 17 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PLOTUTILS_DEPEND_MK:=	${PLOTUTILS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		plotutils
endif

ifeq (+,$(PLOTUTILS_DEPEND_MK)) # ------------------------------------------

PREFER.plotutils?=	system

DEPEND_USE+=		plotutils

DEPEND_ABI.plotutils?=	plotutils>=4.2

SYSTEM_SEARCH.plotutils=	\
	'include/plotter.h:/PL_LIBPLOT_VER_STRING .*"/s/[^.0-9]//gp'	\
	'lib/libplot.{a,so}'

SYSTEM_PKG.Debian.plotutils=	libplot-dev
SYSTEM_PKG.Fedora.plotutils=	plotutils-devel
SYSTEM_PKG.NetBSD.plotutils=	graphics/plotutils
SYSTEM_PKG.Ubuntu.plotutils=	libplot-dev

endif # PLOTUTILS_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
