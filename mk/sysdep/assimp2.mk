# robotpkg sysdep/assimp2.mk
# Created:			Florent on Thu Aug 01, 2013
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ASSIMP2_DEPEND_MK:=		${ASSIMP2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			assimp2
endif

ifeq (+,$(ASSIMP2_DEPEND_MK)) # --------------------------------------------

PREFER.assimp2?=		system

DEPEND_USE+=			assimp2

DEPEND_ABI.assimp2?=		assimp2>=2<3

SYSTEM_SEARCH.assimp2=\
  'include/assimp/assimp.h'				\
  'lib/libassimp.{so,a}'				\
  'lib/pkgconfig/assimp.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.assimp2=	libassimp-dev
SYSTEM_PKG.Fedora.assimp2=	assimp-devel
SYSTEM_PKG.Ubuntu.assimp2=	libassimp-dev

endif # ASSIMP2_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
