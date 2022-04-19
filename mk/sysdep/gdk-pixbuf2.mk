# robotpkg sysdep/gdk-pixbuf2.mk
# Created:			Anthony Mallet on Tue Apr  2 2022
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
GDK_PIXBUF2_DEPEND_MK:=		${GDK_PIXBUF2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gdk-pixbuf2
endif

ifeq (+,$(GDK_PIXBUF2_DEPEND_MK)) # ----------------------------------------

PREFER.gdk-pixbuf2?=		system
DEPEND_USE+=			gdk-pixbuf2
DEPEND_ABI.gdk-pixbuf2?=	gdk-pixbuf2>=2<3

SYSTEM_SEARCH.gdk-pixbuf2=	\
  'include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf.h'			\
  'lib/pkgconfig/gdk-pixbuf-2.0.pc:/Version/s/[^.0-9]//gp'

include ../../mk/sysdep/shared-mime-info.mk

endif # GDK_PIXBUF2_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
