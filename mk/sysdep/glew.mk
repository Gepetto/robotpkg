# robotpkg sysdep/glew.mk
# Created:			Anthony Mallet on Mon  5 Nov 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GLEW_DEPEND_MK:=	${GLEW_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		glew
endif

ifeq (+,$(GLEW_DEPEND_MK)) # -----------------------------------------------

PREFER.glew?=		system
DEPEND_USE+=		glew
DEPEND_ABI.glew?=	glew>=1.5

SYSTEM_SEARCH.glew=	\
	include/GL/glew.h	\
	lib/libGLEW.so		\
	'lib/pkgconfig/glew.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.glew=glew-devel
SYSTEM_PKG.Ubuntu.glew=libglew1.6-dev
SYSTEM_PKG.Debian.glew=libglew1.6-dev
SYSTEM_PKG.NetBSD.glew=graphics/glew

endif # GLEW_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
