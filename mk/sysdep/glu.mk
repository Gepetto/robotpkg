# robotpkg sysdep/glu.mk
# Created:			Anthony Mallet on Tue Dec 15 2009
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GLU_DEPEND_MK:=		${GLU_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		glu
endif

ifeq (+,$(GLU_DEPEND_MK)) # ------------------------------------------------

PREFER.glu?=		system

DEPEND_USE+=		glu

DEPEND_ABI.glu?=	glu>=7

SYSTEM_SEARCH.glu=	\
	'include/GL/glu.h'						\
	'lib/libGLU.*'							\
	'lib/pkgconfig/glu.pc:/Version/s/[^.0-9]//gp'

SYSTEM_PKG.Fedora.glu=	mesa-libGLU-devel
SYSTEM_PKG.Ubuntu.glu=	libglu1-mesa-dev
SYSTEM_PKG.Debian.glu=	libglu1-mesa-dev
SYSTEM_PKG.NetBSD.glu=		pkgsrc/graphics/glu

endif # GLU_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
