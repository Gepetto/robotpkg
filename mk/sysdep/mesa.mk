# robotpkg sysdep/mesa.mk
# Created:			Anthony Mallet on Tue Dec 15 2009
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MESA_DEPEND_MK:=	${MESA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mesa
endif

ifeq (+,$(MESA_DEPEND_MK)) # -----------------------------------------------

PREFER.mesa?=		system

DEPEND_USE+=		mesa

DEPEND_ABI.mesa?=	mesa>=6.5

SYSTEM_SEARCH.mesa=	\
	'include/GL/gl.h:/*.*Version/s/[^.0-9]//gp'			\
	'lib/libGL.*'							\
	'lib/pkgconfig/gl.pc:/Version/s/[^.0-9]//gp'

SYSTEM_PKG.Fedora.mesa=	mesa-libGL-devel
SYSTEM_PKG.Ubuntu.mesa=	libgl1-mesa-dev
SYSTEM_PKG.Debian.mesa=	libgl1-mesa-dev
SYSTEM_PKG.NetBSD.mesa=		pkgsrc/graphics/MesaLib

endif # MESA_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
