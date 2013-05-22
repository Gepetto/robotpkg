# robotpkg depend.mk for:	graphics/assimp
# Created:			Matthieu Herrb on Thu, 4 Nov 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ASSIMP_DEPEND_MK:=	${ASSIMP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		assimp
endif

ifeq (+,$(ASSIMP_DEPEND_MK)) # ---------------------------------------------

PREFER.assimp?=		robotpkg

DEPEND_USE+=		assimp

DEPEND_ABI.assimp?=	assimp>=3.0
DEPEND_DIR.assimp?=	../../graphics/assimp

SYSTEM_SEARCH.assimp=\
	bin/assimp						\
	include/assimp/version.h				\
	'lib/pkgconfig/assimp.pc:/Version/s/[^0-9.]//gp'	\
	lib/libassimp.so

endif # ASSIMP_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
