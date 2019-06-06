# robotpkg depend.mk for:	graphics/assimp
# Created:			Matthieu Herrb on Thu, 4 Nov 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ASSIMP_DEPEND_MK:=	${ASSIMP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		assimp
endif

ifeq (+,$(ASSIMP_DEPEND_MK)) # ---------------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Gentoo,${OS_FAMILY})
  PREFER.assimp?=	robotpkg
else ifeq (NetBSD,${OPSYS})
  PREFER.assimp?=	robotpkg
endif
PREFER.assimp?=		system

DEPEND_USE+=		assimp

DEPEND_ABI.assimp?=	assimp>=2.0
DEPEND_DIR.assimp?=	../../graphics/assimp

SYSTEM_SEARCH.assimp=\
	bin/assimp						\
	'include/assimp/{aiV,v}ersion.h'			\
	'lib/pkgconfig/assimp.pc:/Version/s/[^0-9.]//gp'	\
	lib/libassimp.so

SYSTEM_PKG.RedHat.assimp=assimp assimp-devel
SYSTEM_PKG.Debian.assimp=assimp-utils libassimp-dev

endif # ASSIMP_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
