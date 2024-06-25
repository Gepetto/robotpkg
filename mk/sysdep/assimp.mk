# robotpkg sysdep/assim.mk
# Created:			Matthieu Herrb on Thu, 4 Nov 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ASSIMP_DEPEND_MK:=	${ASSIMP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		assimp
endif

ifeq (+,$(ASSIMP_DEPEND_MK)) # ---------------------------------------------

PREFER.assimp?=		system

DEPEND_USE+=		assimp

DEPEND_ABI.assimp?=	assimp>=3.0

SYSTEM_SEARCH.assimp=\
  'include/assimp/{aiV,v}ersion.h'			\
  'lib/pkgconfig/assimp.pc:/Version/s/[^0-9.]//gp'	\
  'lib/libassimp.so'

SYSTEM_PKG.RedHat.assimp=assimp assimp-devel
SYSTEM_PKG.Debian.assimp=assimp-utils libassimp-dev
SYSTEM_PKG.NetBSD.assimp=multimedia/assimp

endif # ASSIMP_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
