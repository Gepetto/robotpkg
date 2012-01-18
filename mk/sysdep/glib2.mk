# robotpkg sysdep/glib2.mk
# Created:			Anthony Mallet on Thu Dec  3 2009
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GLIB2_DEPEND_MK:=	${GLIB2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		glib2
endif

ifeq (+,$(GLIB2_DEPEND_MK)) # ----------------------------------------------

PREFER.glib2?=		system
DEPEND_USE+=		glib2
DEPEND_ABI.glib2?=	glib2>=2.20

SYSTEM_PKG.Fedora.glib2=	glib2-devel
SYSTEM_PKG.NetBSD.glib2=	pkgsrc/devel/glib2

SYSTEM_SEARCH.glib2=	\
	'include/{,glib/}glib-2.0/glib.h'				\
	'lib/glib-2.0/include/glibconfig.h'				\
	'lib/libglib-2.0.{a,so}'					\
	'lib/pkgconfig/glib-2.0.pc:/Version/s/[^.0-9]//gp'

endif # GLIB2_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
