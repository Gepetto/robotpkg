# robotpkg sysdep/freeglut.mk
# Created:			Severin Lemaignan on Wed 1 Sep 2010
#

# freeglut is a completely open source alternative to the OpenGL Utility
# Toolkit (GLUT) library with an OSI approved free software license. GLUT was
# originally written by Mark Kilgard to support the sample programs in the
# second edition OpenGL 'RedBook'. Since then, GLUT has been used in a wide
# variety of practical applications because it is simple, universally available
# and highly portable.

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FREEGLUT_DEPEND_MK:=	${FREEGLUT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		freeglut
endif

ifeq (+,$(FREEGLUT_DEPEND_MK)) # ---------------------------------------------

PREFER.freeglut?=	system
DEPEND_USE+=		freeglut
DEPEND_ABI.freeglut?=	freeglut>=2.4.0

SYSTEM_SEARCH.freeglut=	\
	include/GL/glut.h \
	lib/libGLU.so

SYSTEM_PKG.Linux-fedora.freeglut=freeglut-devel
SYSTEM_PKG.Linux-ubuntu.freeglut=freeglut3-dev

endif # FREEGLUT_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
